require 'rails_helper'

describe OxfordService, type: :model do
  before(:each) do
    @service = OxfordService.new('foxes')
    @bad_service = OxfordService.new('foxez')
  end
  it 'has attributes' do
    expect(@service.word).to eq('foxes')
  end
  it 'can get back word root' do
    VCR.use_cassette('root') do
      expect(@service.word_root).to eq('fox')
    end
  end
  it 'gives back false if no word root' do
    VCR.use_cassette('wrong_root') do
      expect(@bad_service.word_root).to be_falsey
    end
  end
end
