class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable

  has_one_attached :avatar

  has_many :posts, dependent: :destroy
  has_many :documents, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  validate :correct_avatar_mime_type

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  
  def correct_avatar_mime_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/png image/jpeg image/jpg image/gif))
      avatar.purge # delete the uploaded file
      errors.add(:avatar, 'Please upload only PNG, JPEG, JPG and GIF image formats')
    end
  end
end
