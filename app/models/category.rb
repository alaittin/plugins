class Category < ActiveRecord::Base
  validates_presence_of  :name
  validates_length_of     :name, :within => 2..30 

  has_many  :plugins
end
