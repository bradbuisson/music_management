class ArticlesController < ApplicationController
  before_filter :signed_in_user, except: [:index, :feed]

  def index
    @title = "News"
    @articles = Article.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def show
    @article = Article.find(params[:id])
    @title = @article.content
  end

  def new
    @article = Article.new
    @title = "New Headline"

    respond_to do |format|
      format.js
      format.json { render json: @blog }
    end
  end

  def edit
    @article = Article.find(params[:id])
    @title = "Edit Article | #{@article.content}"
    respond_to :js
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: articles_url }
      else
        format.html { @articles = []
                      flash.now[:notice] = "Something went wrong with your request."
                      render 'index' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_url, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { @articles = []
                      flash.now[:notice] = "Something went wrong with your request."
                      render 'index' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Your article was removed" }
      format.json { head :no_content }
    end
  end

  def feed
    @articles = Article.all
    respond_to do |format|
      format.atom
      format.xml { render :json => @articles }
    end
  end
end
