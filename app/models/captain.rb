class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats

  def self.catamaran_operators
    self.joins(:classifications).where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    self.joins(:classifications).where("classifications.name = 'Sailboat'").uniq
  end

  def self.talented_seafarers
    self.joins(:classifications).where("classifications.name.include 'Sailboat' AND classifications.name.include 'Motorboat'").uniq
  end
end
