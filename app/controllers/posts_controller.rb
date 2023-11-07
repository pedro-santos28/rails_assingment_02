class PostsController < ApplicationController

  before_action :require_user_logged_in!, only: [:new]
  before_action :get_post, only: [:show, :edit, :update]

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:notice] = "Your post has been updated"
      redirect_to show_posts_path(@post.id)
    else
      flash.now[:alert] = "Your post couldn't be updated"
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    if @post.save
      flash.now[:notice] = "Your post has been created"
      redirect_to root_path
    else
      flash.now[:alert] = "Your post couldn't be created"
      render :new, status: :unprocessable_entity
    end

  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def get_post
      @post = Post.find_by(id: params[:id])
    end

end
