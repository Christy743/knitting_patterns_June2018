class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :content

  belongs_to :user, serializer: PatternUserSerializer
  has_many :comments
  has_many :favorite_patterns

  def user
    object.user
  end

end
