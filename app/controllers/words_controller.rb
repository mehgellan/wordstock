class WordsController < ApplicationController
  before_action :set_topic, only: [:index, :new, :create]
  before_action :set_word, only: [:show, :edit, :update, :delete]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
    @word.topic_id = @topic
  end

  def create
    @word = @topic.words.new(word_params)
    @topic.words << @word
    if @word.save
      flash[:success] = "Word successfully created!"
      redirect_to topic_path(@word.topic_id)
    else
      flash[:error] = @word.errors.full_messages.join(", ")
      redirect_to new_topic_word_path(@word.topic_id)
    end
  end

  def show
    render :show
  end

  private

    def set_topic
      @topic = Topic.find_by_id(params[:topic_id])
    end

    def set_word
      @word = Word.find_by_id(params[:id])
    end

    def word_params
      params.require(:word).permit(:term, :pos, :definition)
    end

end
