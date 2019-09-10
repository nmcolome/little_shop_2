class Review < ApplicationRecord
  belongs_to :item

  validates :title, :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end