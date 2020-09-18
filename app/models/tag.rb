class Tag < ApplicationRecord

  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations, foreign_key: "tag_id", dependent: :destroy
  
  validates :name, uniqueness: true
end
