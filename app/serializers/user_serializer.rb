class UserSerializer < ActiveModel::Serializer
  attributes :patterns, :name

  has_many :patterns
end
