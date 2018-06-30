class CommentSerializer < ActiveModel::Serializer
  attributes :content

  belongs_to :pattern
end
