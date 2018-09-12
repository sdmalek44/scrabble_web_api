require 'rails_helper'

describe WordPresenter, type: :model do
  before(:each) do
    @presenter = WordPresenter.new('foxes')
    @bad_presenter = WordPresenter.new('foxez')
  end
  it 'can present a message for a valid word' do
    message = "'foxes' is a valid word and its root form is 'fox'."
    expect(@presenter.display_word_root).to eq(message)
  end
  it 'presents different message if word invalid' do
    message = "'foxez' is not a valid word."
    expect(@bad_presenter.display_word_root).to eq(message)
  end
end
