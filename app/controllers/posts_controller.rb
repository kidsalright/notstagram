class PostsController < ApplicationController

  before_action :set_post, only: %i[ show ]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(posts_params)
    if @post.save
      redirect_to root_path
    end
  end

  private

  def posts_params
    params.require(:post).permit(:image, :title)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
