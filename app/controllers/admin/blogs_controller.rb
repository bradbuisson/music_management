class Admin::BlogsController < ApplicationController
  before_filter :admin_user

  respond_to :js

  def index
    @title = "Blog Entries"
    @drafts = Blog.unpublished.page(params[:page])
    @blogs = Blog.published.page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
    @title = @blog.title
  end

  def new
    @title = "New Blog"
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
    @title = "Editing #{@blog.title}"
  end

  def create
    @blog = Blog.new(params[:blog])
    @drafts = Blog.unpublished.page(params[:page])
    @blogs = Blog.published.page(params[:page])
    if @blog.save
      @title = "New Entry: #{@blog.title}"
      respond_with @blog
    else
      @title = "Please try again"
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    @drafts = Blog.unpublished.page(params[:page])
    @blogs = Blog.published.page(params[:page])
    if @blog.update_attributes(params[:blog])
      @title = "Updated Entry: #{@blog.title}"
      respond_with @blog
    else
      @title = "Please try again"
      render :edit
    end
  end

  def destroy
    @drafts = Blog.unpublished.page(params[:page])
    @blogs = Blog.published.page(params[:page])
    @blog = Blog.find(params[:id])
    @title = "#{@blog.title} Removed"
    @blog.tags.destroy && @blog.destroy
    respond_with @drafts, @blogs
  end
end
