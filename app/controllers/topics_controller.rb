class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def new
  end

  def create
  end

  def show
  end

end
