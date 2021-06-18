class Admin::TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path, notice: 'tagの作成に成功しました。'
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
