class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  after_filter :set_csrf_cookie_for_ng

  protected

    def verified_request?
      super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
    end

  private

    def set_csrf_cookie_for_ng
      cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    end
end
