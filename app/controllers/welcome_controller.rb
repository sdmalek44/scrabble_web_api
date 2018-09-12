class WelcomeController < ApplicationController
  def index
    @presenter = WordPresenter.new(word_params[:word]) if word_params[:word]
  end

  private

  def word_params
    params.permit(:word)
  end
end
