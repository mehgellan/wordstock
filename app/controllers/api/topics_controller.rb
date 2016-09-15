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
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:success] = "Your topic, #{@topic.name} was successfully created!"
      render json: @topic
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      redirect_to new_user_topic_path(@user)
    end
  end

  def edit
    @topic = Topic.find_by_id(params[:id])
    render json: @topic
  end

  def update
    @topic = Topic.find_by_id(params[:id])
    @topic.update(topic_params)
    if @topic.save
      render json: @topic
    else
      render json: {errors: @word.errors.full_messages.join(", "), status: :unprocessable_entity}
    end
  end

  def destroy
    
  end

  private

    def topic_params
      params.require(:topic).permit(:name)
    end

end
