class Admin::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path(@post)
    else
      render :new
   end
  end

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :shop_name, :address, :url, :business_hours, :genre_id, tag_ids: [])
  end

end
