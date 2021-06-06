class PostsController < ApplicationController
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
  
end
