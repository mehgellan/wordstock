class Api::WordsController < ApplicationController
  def index
    @words = Word.all.where(:topic_id => params[:topic_id]).order("term DESC")
    render json: @words
  end
  def new
    @word = Word.new
    render json: @word
  end
  def create
    @topic = Topic.find_by_id(params[:topic_id])
    @word = @topic.words.new(word_params)
    if @word.save
      flash[:success] = "Your word, #{@word.term} was successfully created!"
      render json: @word
    else
      flash[:error] = @word.errors.full_messages.join(", ")
      redirect_to new_api_topic_word(@topic)
    end
  end

  private

    def word_params
      params.require(:word).permit(:term, :pos, :definition)
    end
end
