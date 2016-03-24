class WordsController < ApplicationController
  # before_action :find_word, only: [:show, :edit, :update, :destroy]
  def index
    @words = current_user.words.all
  end

  def pick_study_params
    if current_user.words.where(category_id: !nil).any?
      @words = current_user.words.where(category_id: !nil).uniq
      @categories = []
      @words.each do |word|
        @categories << Category.where(id: word.category_id)
      end
    end
    @categories
  end

  def show
  end

  def new
    @word = current_user.words.new
  end

  def create
    @word = current_user.words.new(word_params)
    @word.user_id = current_user.id
    if @word.save
      redirect_to words_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update(word_params)
      redirect_to words_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to words_path
  end

  private

    def word_params
      params.require(:word).permit(:english, :dutch)
    end

    def find_word
      @word = current_user.words.find(params[:id])
    end
# android studio
    # def find_all_words
    #   @words = current_user.words.all
    # end
end
