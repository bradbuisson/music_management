class TagsController < ApplicationController

  def show
    @tag = Tag.find_by_name(params[:id])
    @blogs = @tag.blogs.paginate(page: params[:page]).where("published = ?", true)
  end
end
