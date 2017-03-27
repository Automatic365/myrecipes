class Comment < ApplicationRecord
  validates_presence_of :description, length:{minimum: 4, maximum: 150}
  validates_presence_of :chef_id
  validates_presence_of :recipe_id
  belongs_to :chef
  belongs_to :recipe
  default_scope -> { order(updated_at: :desc) }

end
