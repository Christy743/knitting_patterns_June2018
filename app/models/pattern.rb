class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  #has_many :users, through: :comments
  #has_many :favorite_patterns


  #validates_presence_of :name, :content

  #accepts nested attribute custom method for needles and yarn

  def grouped_comments
    grouped_comments_hash = {}
    self.comments.each do |comment|
      if grouped_comments_hash.keys.include?(comment.user.username)
        grouped_comments_hash[comment.user.username] << comment
      else
        grouped_comments_hash[comment.user.username] = [comment]
      end
    end
    grouped_comments_hash
  end

end
