class Admin::ArticlesController < ApplicationController
  before_filter :admin_user

  respond_to :js

  def index
    @title = "Your Headlines"
    @articles = Article.page(params[:page])
    @article = Article.new
  end

  def new
    @title = "New Article"
    @article = Article.new
  end

  def edit
    @title = "Editing Article"
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @articles = Article.page(params[:page])
    if @article.save
      @title = "New Article"
      respond_with @article
    else
      @title = "Please try again"
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      @title = "Updated Article"
      respond_with @article
    else
      @title = "Please try again"
      render :edit
    end
  end

  def destroy
    @articles = Article.page(params[:page])
    @article = Article.find(params[:id])
    @title = "Article Removed"
    @article.destroy
    respond_with @articles
  end
end
