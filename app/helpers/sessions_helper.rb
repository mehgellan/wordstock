module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user!
    # FIXME: logged in user can't visit profile
    # if session[:user_id] != @user[:id]
    #   flash[:error] = "Sorry! You aren't authorized for that."
    #   redirect_to login_path
    # else
    #   redirect_to user_path(@user)
    # end
    redirect_to login_path unless current_user
  end

  def logout
    @current_user = session[:user_id] = nil
  end
end
