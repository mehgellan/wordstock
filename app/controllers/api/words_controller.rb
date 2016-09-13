class Api::WordsController < ApplicationController
  def index
    @words = Word.all.where(:topic_id => params[:topic_id]).order("term DESC")
    render json: @words
  end
end
