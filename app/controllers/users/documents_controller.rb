class Users::DocumentsController < ApplicationController
  before_action :set_user

  def index
    @documents = @user.documents.order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def new
    @document = @user.documents.new
  end

  def create
    @document = @user.documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to action: 'index', notice: 'Document was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def document_params
    params.require(:document).permit(:user_id, :name, :date, :file)
  end
end
