class City < ActiveRecord::Base
  validates_uniqueness_of :name
  def to_param
    name
  end

  def self.find_by_param(input)
    find_by_name(input)
  end

end
