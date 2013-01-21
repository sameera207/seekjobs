class City < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  
  has_many :jobs

  def self.city_not_specified
    City.find_by_name("Not-Specified").try(:id)
  end
  
end
