class DashboardController < ApplicationController

  def home
    @title = "Home"
    @articles = Article.paginate(page: params[:page], per_page: 4)
    @shows = Show.paginate(page: params[:page], per_page: 3)
    @blog = Blog.published.sort_by(&:updated_at).last
  end
end
