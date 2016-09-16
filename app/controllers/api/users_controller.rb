class Api::UsersController < ApplicationController
  def show
    # TODO: You can just write @user = current_user
    @user = User.find(current_user[:id])
    render json: @user
  end
end
