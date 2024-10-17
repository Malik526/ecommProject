class Category < ApplicationRecord
    has_one_attached :image
    has_many :products, dependent: :restrict_with_error
  
    # Define the variant
    def thumbnail
      image.variant(resize_to_limit: [100, 100]).processed
    end
  end
  
