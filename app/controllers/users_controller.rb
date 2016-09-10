class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:notice] = "Successfully signed in!"
      redirect_to user_path(new_user)
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
  def show
    render :show
  end
  
  private

    def user_params
      params.require(:user).permit(:first_name, :email, :password)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
