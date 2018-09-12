class WelcomeController < ApplicationController
  def index
    @presenter = WordPresenter.new(params[:word]) if params[:word]
  end

end
