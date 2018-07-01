class Comment < ActiveRecord::Base
  belongs_to :pattern
  #belongs_to :commentable, polymorphic: true
  #has_many :comments, as: :commentable

  #def next
  #  comment = Comment.where("id > ?", id).first
#
#    if comment
#      comment
#    else
#      Comment.first
#    end
#
#  end

end
