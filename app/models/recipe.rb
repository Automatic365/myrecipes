class Recipe < ApplicationRecord
  validates_presence_of :name, :chef_id
  validates_presence_of :description, length:{minimum:5, maximum:500}
  validates_uniqueness_of :name, :description
  belongs_to :chef
  default_scope -> { order(updated_at: :desc) }
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
end
