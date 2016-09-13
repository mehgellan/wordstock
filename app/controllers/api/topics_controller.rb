class Api::TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: @topics
  end
  def show
    @topic = Topic.find_by_id(params[:id])
    render json: @topic
  end
  def new
    @topic = Topic.new
    render json: @topic
  end
  def create
    topic_params = params.require(:topic).permit(:name)
    @topic = current_user.topics.new(topic_params)
    @user.topics << @topic
    if @topic.save
      flash[:success] = "Your topic, #{@topic.name} was successfully created!"
      render json: @topic
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      redirect_to new_user_topic_path(@user)
    end
  end

end
