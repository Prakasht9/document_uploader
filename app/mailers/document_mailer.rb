class DocumentMailer < ApplicationMailer

  def upload_email(user_id, document_id)
    @user = User.find_by(id: user_id)
    @document = Document.find_by(id: document_id)
    file = @document.file
    attachments[file&.blob&.filename.to_s] = { mime_type: file&.blob&.content_type, content: file&.blob&.download }
    mail(to: 'sahilsatishrohmehtra@gmail.com', subject: "File from #{@user.full_name}: #{@document.date.strftime("%d-%m-%Y")}")
  end
end
