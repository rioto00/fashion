class Post < ApplicationRecord
  
  belongs_to :user
  
  validates :title, presence: true
  validates :content, presence: true
  
  # has_many_attached :post_images
  
   
  has_one_attached :post_image
  
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  has_one_attached :post_image1
  
  def get_post_image1(width, height)
    unless post_image1.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image1.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      post_image1.variant(resize_to_limit: [width, height]).processed
  end
  
  has_one_attached :post_image2
  
  def get_post_image2(width, height)
    unless post_image2.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image2.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      post_image2.variant(resize_to_limit: [width, height]).processed
  end
  
  has_one_attached :post_image3
  
  def get_post_image3(width, height)
    unless post_image3.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image3.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      post_image3.variant(resize_to_limit: [width, height]).processed
  end
  
  has_one_attached :post_image4
  
  def get_post_image4(width, height)
    unless post_image4.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image4.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      post_image4.variant(resize_to_limit: [width, height]).processed
  end
  
end