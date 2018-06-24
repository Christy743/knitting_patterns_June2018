class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :user
  #has_many :comments
  has_many :favorite_patterns

  def user
    #binding.pry
    object.user
  end

end
