class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path(@post), notice: '投稿に成功しました。'
    else
      render :new
   end
  end

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
    params.require(:post).permit(:title, :avatar, :body, :shop_name, :address, :url, :business_hours, :genre_id, tag_ids: [])
  end

end
