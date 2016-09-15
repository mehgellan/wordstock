class TopicsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    @user.topics << @topic
    if @topic.save
      flash[:success] = "Your topic, #{@topic.name} was successfully created!"
      redirect_to user_path(@user)
    else
      flash[:error] = @topic.errors.full_messages.join(", ")
      redirect_to new_user_topic_path(@user)
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    @topic.update(topic_params)
    flash[:notice] = "Topic updated successfully"
    redirect_to topic_path(@topic)
  end

  def destroy
    @topic.destroy
    redirect_to user_path(@topic.user_id)
  end


  private

    def set_topic
      @topic = Topic.find_by_id(params[:id])
    end

    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def topic_params
      params.require(:topic).permit(:name)
    end

end
