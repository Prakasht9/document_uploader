class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validate :correct_avatar_mime_type

  private
  
  def correct_avatar_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/png image/jpeg image/jpg image/gif))
      avatar.purge # delete the uploaded file
      errors.add(:avatar, 'Please upload only PNG, JPEG, JPG and GIF image formats')
    end
  end
end
