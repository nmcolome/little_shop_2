class Review < ApplicationRecord
  belongs_to :item

  paginates_per 8

  validates :title, :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  def self.top_reviews
    order(rating: :desc).limit(3)
  end

  def self.bottom_reviews
    order(:rating).limit(3)
  end

  def self.average_rating
    average(:rating).to_f.truncate(2)
  end
end