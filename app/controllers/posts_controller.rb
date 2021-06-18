class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @posts = @posts.page(params[:page]).per(10).order(created_at: :desc)
    @genres = Genre.all
    # urlにcategory_id(params)がある場合
    if params[:genre_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @genre = Genre.find(params[:genre_id])
      # category_idと紐づく投稿を取得
      @posts = @genre.posts.page(params[:page]).per(10).order(created_at: :desc)
    else
      # 投稿すべてを取得
      @posts = @posts.page(params[:page]).per(10).order(created_at: :desc)
    end
  end

  def show
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find(params[:id])
    @genres = Genre.all
    @review = Review.new
  end
end
