class Post < ApplicationRecord
  attachment :image
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations

  validates :title, presence: true
  validates :body, presence: true
  validates :shop_name, presence: true
end
