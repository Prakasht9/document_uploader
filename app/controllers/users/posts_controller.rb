class Users::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = @user.posts.order(created_at: :desc).includes(:user)
      .paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def new
    @post = @user.posts.new
  end

  def edit
  end

  def create
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:success] = 'Tradescore was successfully created.'
        format.html { redirect_to @post }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = 'Tradescore was successfully updated.'
        format.html { redirect_to @post }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :avatar)
  end
end
