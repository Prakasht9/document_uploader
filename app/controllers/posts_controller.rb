class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
