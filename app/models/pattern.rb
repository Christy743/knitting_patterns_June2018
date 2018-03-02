class Pattern < ActiveRecord::Base
  belongs_to :user #, optional: true
  has_many :needles
  has_many :yarns
  #has_many :other_notions
  has_many :comments
  #has_many :users, through: :comments
  #has_many :favorite_patterns

  #accepts_nested_attributes_for :needles, reject_if: :all_blank
  #accepts_nested_attributes_for :user, reject_if: :all_blank
  #validates_associated :needles

  #validates_presence_of :name, :content

  #accepts nested attribute custom method for needles and yarns


  def needle_attributes=(needle_attributes)
    #needles_attributes.each do |i, needle_attributes|
      self.needle = Needle.find_or_create_by(name: needle.name, us_size: needle.us_size)
      self.needle.update(needle)
      #self.needles.build(needle_attributes)
    #end
  end

  def yarns_attributes=(yarns_attributes)
    self.yarn = Yarn.find_or_create_by(name: yarn.name, weight: yarn.weight, quantity: yarn.quantity)
    self.yarn.update(yarn)
    #yarns_attributes.each do |i, yarn_attributes|
      #self.yarns.build(yarn_attributes)
    #end
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
