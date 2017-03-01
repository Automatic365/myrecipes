class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description, length:{minimum:5, maximum:100}
  validates_uniqueness_of :name, :description
  # belongs_to :chef
end
