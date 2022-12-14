class Recipe < ApplicationRecord
  enum status: { draft: 0, in_review: 1, published: 2 }

  belongs_to :recipe_type
  belongs_to :cuisine
  belongs_to :author, optional: true, foreign_key: 'user_id', class_name: 'User'
end
