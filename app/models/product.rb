# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images  # For handling multiple images
  has_many :stocks, dependent: :destroy # Add this line to establish the relationship
  
  def thumbnail
    images.first.variant(resize_to_limit: [100, 100]).processed if images.attached?
  end

  # Virtual attribute for category name
  def category_name
    category.try(:name)
  end

  def category_name=(name)
    self.category = Category.find_by(name: name)
  end
end


