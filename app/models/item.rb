class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :is_active, inclusion: { in: [true, false] }
  end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  # def price_including_tax
    # (self.price * 1.1).round
  # end
  
  
end
