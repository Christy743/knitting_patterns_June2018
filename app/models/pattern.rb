class Pattern < ActiveRecord::Base
  belongs_to :user
  has_many :needles
  has_many :yarns
  has_many :comments

  #validates_presence_of :name, :content

  #accepts nested attribute custom method for needles and yarns

  def needles_attributes=(needles_attributes)
    binding.pry
    needles_attributes.values.each do |needle_attributes|
      self.needles.build(needle_attributes)
    end
  end

end
