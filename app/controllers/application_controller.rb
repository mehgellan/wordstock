class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include TopicsHelper

  after_filter :set_csrf_cookie_for_ng

  # def redirect_to_path
  #   if current_user
  #     redirect_to user_path(current_user)
  #   else
  #     redirect_to login_path
  #   end
  # end

  protected

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

  private

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end
end
