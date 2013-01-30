class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @blogs = @tag.blogs.published.page(params[:page])
  end
end
