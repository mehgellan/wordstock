class Api::TopicsController < ApplicationController
  def index
    @topics = Topic.all
    render json: @topics
  end
  def show
    @topic = Topic.find_by_id(params[:id])
    render json: @topic
  end
end
