class BlogsController < ApplicationController

  def index
    @title = "Samuel Raines Blog"
    @blogs = Blog.published.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @title = @blog.title

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @blog }
    end
  end
end
