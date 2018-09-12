class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :score

  def user_id
    object.id
  end
  
  def score
    object.plays.sum(:score)
  end

end
