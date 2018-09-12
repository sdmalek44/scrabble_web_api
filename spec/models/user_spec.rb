require 'rails_helper'

describe User, type: :model do
  context "relationships" do
    it {should have_many :plays}
  end
end
