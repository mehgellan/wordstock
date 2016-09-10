module UsersHelper
  def set_user
    @user = User.find_by_id(params[:id])
  end
end
