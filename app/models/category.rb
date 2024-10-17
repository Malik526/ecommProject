class Category < ApplicationRecord
    has_one_attached :image
  
    # Define the variant
    def thumbnail
      image.variant(resize_to_limit: [100, 100]).processed
    end
  end
  
