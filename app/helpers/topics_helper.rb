module TopicsHelper
  # def current_user_is_owner?
  #   session[:user_id] == @topic.user_id
  # end
  def set_topic
    @topic = Topic.find_by_id(params[:id])
  end
end
