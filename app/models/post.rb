class Post < ApplicationRecord

  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations, foreign_key: "post_id", dependent: :destroy
  belongs_to :user
  
  has_one_attached :image
  has_many :comments
  
end
