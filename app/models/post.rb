class Post < ApplicationRecord
  
  is_impressionable counter_cache: true
  attachment :image
  has_many :post_tag_relations, dependent: :delete_all
  has_many :tags, through: :post_tag_relations
  belongs_to :genre
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :shop_name, presence: true

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
