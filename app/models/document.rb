class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validate :correct_avatar_mime_type
  before_save :set_name
  after_commit :send_email

  private

  def set_name
    self.name = self.file.blob.filename if self.name.blank? 
  end

  def send_email
    DocumentMailer.upload_email(self.user.id, self.id).deliver_now
  end

  def correct_avatar_mime_type
    if file.attached? && !file.content_type.in?(%w(application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.ms-excel text/csv ))
      file.purge # delete the uploaded file
      errors.add(:file, 'Please upload only .xls, .xlsx, and .csv')
    end
  end
end
