class Plugin < ActiveRecord::Base
  validates_presence_of :name, :description, :url, :category_id
  validates_uniqueness_of :name
  validates_numericality_of :category_id 

  belongs_to  :category
  acts_as_rateable
end
