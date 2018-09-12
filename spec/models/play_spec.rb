require 'rails_helper'

describe Play do
  context "relationships" do
    it {should belong_to :user}
    it {should belong_to :game}
  end
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")

        expect(play.score).to eq(6)
      end
    end
    context "#letter_scores" do
      it "scores the word" do
        play = create(:play, word: "assess")

        expected =
        {
          "A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
          "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
          "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10
        }

        expect(play.letter_scores).to eq(expected)
      end
    end

  end
end
