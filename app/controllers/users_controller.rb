class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:notice] = "Successfully signed in!"
      login(new_user)
      redirect_to user_path(new_user)
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Updated account info!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    # TODO: add logic to delete all users info as well topic-words-examples
    @user.destroy
    logout
    flash[:notice] = "Your account was successfully deleted"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end
end
