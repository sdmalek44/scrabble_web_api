class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [object.player_1, object.player_2]
  end
  
end
