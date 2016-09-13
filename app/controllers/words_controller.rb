class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_topic, only: [:index, :new, :create]
  before_action :set_word, only: [:show, :edit, :update, :destroy]

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
    render json: :show
  end

  def edit
    render json: :edit
  end

  def update
    if @word.update_attributes(word_params)
      flash[:success] = "Word successfully updated"
      redirect_to word_path(@word)
    else
      flash[:error] = @word.errors.full_messages.join(", ")
      redirect_to topic_path(@word.topic_id)
    end
  end

  def destroy
    @word.destroy
    flash[:notice] = "Your word was successfully deleted"
    redirect_to topic_path(@word.topic_id)
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
