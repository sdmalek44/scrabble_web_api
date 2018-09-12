class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [ { user_id: object.player_1.id,
        score: object.player_1.plays.sum(:score),
      },
      {
        user_id: object.player_2.id,
        score: object.player_2.plays.sum(:score)
      }]
  end

end
