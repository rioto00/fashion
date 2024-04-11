class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  
  validates :title, presence: true
  validates :content, presence: true
  
  has_many_attached :post_images
  
  has_one_attached :post_image
   
  validates :post_images, presence: true
  validate :validate_post_images_limit

  MAX_POST_IMAGES = 4
  
  
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
      post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # def get_post_image1(width, height)
  #   unless post_image1.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     post_image1.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  #   end
  #   post_image1.variant(resize_to_limit: [width, height]).processed
  # end
  
  private

  def validate_post_images_limit
    errors.add(:post_images, "は#{MAX_POST_IMAGES}つまでしか添付できません") if post_images.size > MAX_POST_IMAGES
  end
  

  
end