class Pattern < ActiveRecord::Base
  belongs_to :user #, optional: true
  #has_many :needles
  #has_many :yarns
  #has_many :other_notions
  has_many :comments
  has_many :users, through: :comments
  #has_many :favorite_patterns

  #accepts_nested_attributes_for :needles, reject_if: :all_blank

  #validates_associated :needles

  #validates_presence_of :name, :content

  #accepts nested attribute custom method for needles and yarns

  def needles_attributes=(needles_attributes)
    needles_attributes.each do |i, needle_attributes|
      self.needles.build(needle_attributes)
    end
  end

  def yarns_attributes=(yarns_attributes)
    yarns_attributes.each do |i, yarn_attributes|
      self.yarns.build(yarn_attributes)
    end
  end

  def other_notions_attributes=(other_notions_attributes)
    other_notions_attributes.each do |i, other_notion_attributes|
      self.other_notions.build(other_notion_attributes)
    end
  end

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
