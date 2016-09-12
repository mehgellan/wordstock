class WordsController < ApplicationController
  before_action :set_topic, only: [:index, :new, :create]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = @topic.words.new(word_params)
    @topic.words << @word
    if @word.save
      flash[:success] = "Word successfully created!"
      redirect_to topic_words_path(@word.topic_id)
    else
      flash[:error] = @word.errors.full_messages.join(", ")
      redirect_to new_topic_word_path(@word.topic_id)
    end
  end

  private

    def word_params
      params.require(:word).permit(:term, :pos, :definition)
    end

end
