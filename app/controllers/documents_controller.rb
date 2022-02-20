class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:show]

  def index
    @documents = current_user.documents.order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show; end

  private

  def set_document
    @document = Document.find_by(id: params[:id])
  end
end
