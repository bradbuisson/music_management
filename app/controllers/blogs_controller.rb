class BlogsController < ApplicationController
  before_filter :signed_in_user, :except => :index
  before_filter :remove_stale_tags, :only => :update

  def index
    @title = "Samuel Raines Blog"
    @unpublished = Blog.unpublished.page(params[:page])
    @blogs = Blog.published.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def new
    @blog = Blog.new
    @title = "New Blog"

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @blog }
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @title = "Edit Blog | #{@blog.title}"
    respond_to :html, :js
  end

  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_url, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: blogs_url }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to blogs_url, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Your blog was removed" }
      format.json { head :no_content }
    end
  end

private

  def remove_stale_tags
    Tag.all.each { |tag| tag.delete if tag.blogs.empty? }
  end
end
