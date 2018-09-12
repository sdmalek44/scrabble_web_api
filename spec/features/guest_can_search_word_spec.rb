require 'rails_helper'

describe 'user visits root' do
  it 'can search for a word and get root ' do
    visit '/'

    fill_in :word, with: 'foxes'
    click_on 'Validate Word'

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end
  it 'invalid word is given a message' do
    visit '/'

    fill_in :word, with: 'foxez'
    click_on 'Validate Word'

    expect(page).to have_content("'foxez' is not a valid word.")
  end
end
