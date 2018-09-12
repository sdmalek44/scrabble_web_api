class Api::V1::PlaysController < ApiController

  def create
    play = Play.create(play_params)
    render json: play, status: 201
  end

  private

  def play_params
    params.permit(:word, :user_id, :game_id)
  end
end
