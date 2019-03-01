class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(:classifications).where("classification.name = 'Catamaran'")
  end
end
