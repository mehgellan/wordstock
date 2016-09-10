class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    # handles bug if User.confirm returns false
    if @user && @user.valid?
      flash[:notice] = "Successfully logged in, welcome #{@user.first_name}!"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to login_path
    end
  end

  def destroy
    flash[:success] = "Successfully logged out, come back soon #{current_user.first_name}!"
    logout
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
