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
      render json: @word
    else
      flash[:error] = @word.errors.full_messages.join(", ")
      redirect_to new_api_topic_word(@topic)
    end
  end

  def show
    @word = Word.find_by_id(params[:id])
    render json: @word
  end

  def edit
    @word = Word.find_by_id(params[:id])
    render json: @word
  end

  def update
    @word = Word.find_by_id(params[:id])
    @word.update(word_params)
    if @word.save
      flash[:success] = "#{@word.term} has been updated!"
      render json: @word
    else
      render json: {errors: @word.errors.full_messages.join(", "), status: :unprocessable_entity}
    end
  end

  def destroy
    @word = Word.find_by_id(params[:id])
    @word.destroy
    flash[:success] = @word.term + "has been deleted!"
    render json: @word
  end

  private

    def word_params
      params.require(:word).permit(:term, :pos, :definition)
    end
end
