class ReviewsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to post_reviews_path(@review.post), notice: '投稿に成功しました。'
    else
      @post = Post.find(params[:post_id])
      render "posts/show"
    end
  end

  def destroy
    review = Review.find_by(id: params[:id], post_id: params[:post_id])
    review.destroy
    redirect_to post_reviews_path(review.post)
  end

  private

  def review_params
    params.require(:review).permit(:post_id, :score, :content)
  end
end
