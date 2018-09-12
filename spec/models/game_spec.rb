require 'rails_helper'

describe Game, type: :model do
  context "relationships" do
    it {should belong_to :player_1}
    it {should belong_to :player_2}
    it {should have_many :plays}
  end
end
