require 'rails_helper'
describe 'GET /api/v1/games' do
  before(:each) do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)
  end
  context 'GET /api/v1/games/1' do
    it 'can see game json' do
      get '/api/v1/games/1'

      expect(response).to be_success
      game = JSON.parse(response.body, symbolize_names: true)

      expect(game[:game_id]).to eq(1)
      expect(game[:scores][0][:user_id]).to eq(1)
      expect(game[:scores][0][:score]).to eq(15)
      expect(game[:scores][1][:user_id]).to eq(2)
      expect(game[:scores][1][:score]).to eq(16)
    end
  end
  context 'POST /api/v1/games/1/plays' do
    it 'can create a post with a play and update game' do
      post '/api/v1/games/1/plays?user_id=1&word=at'
      
      expect(response).to be(201)

      get '/api/v1/games/1'

      game = JSON.parse(response.body, symbolize_names: true)

      expect(game[:game_id]).to eq(1)
      expect(game[:scores][0][:user_id]).to eq(1)
      expect(game[:scores][0][:score]).to eq(17)
      expect(game[:scores][1][:user_id]).to eq(2)
      expect(game[:scores][1][:score]).to eq(16)
    end
  end
end
