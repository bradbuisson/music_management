class Admin::DashboardController < ApplicationController
  before_filter :admin_user

  def index
    @title = "Dashboard"
    @articles = Article.page(params[:page])
    @article = Article.new
    @shows = Show.page(params[:page])
    @show = Show.new
    @blogs = Blog.published.page(params[:page])
    @blog = Blog.new
    @random_entry = [
      [ @articles, "admin/articles/form", "Headlines", "New Article"  ],
      [ @shows, "admin/shows/form", "Your Shows", "New Show"  ],
      [ @blogs, "admin/blogs/form", "Your Blogs", "New Blog" ]
    ].shuffle.first
  end
end
