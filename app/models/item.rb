class Item < ApplicationRecord
  belongs_to :merchant
  has_many :reviews

  paginates_per 16

  enum status: [:active, :inactive]

  validates :name, :price, :image, :inventory, presence: true
end
