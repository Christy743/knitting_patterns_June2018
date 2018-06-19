class PatternSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :materials,
             :needles, :yarn, :weight, :quantity

  belongs_to :user
  #has_many :comments
  #has_many :favorite_patterns
end
