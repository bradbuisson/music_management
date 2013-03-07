class ArticlesController < ApplicationController

  def index
    @title = "News"
    @articles = Article.page(params[:page])

    respond_to do |format|
      format.atom
      format.html
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @title = @article.content

    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end
end
