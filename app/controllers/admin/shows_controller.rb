class Admin::ShowsController < ApplicationController
  before_filter :admin_user

  respond_to :js

  def index
    @title = "Your Shows"
    @shows = Show.page(params[:page])
    @show = Show.new
  end

  def new
    @title = "New Show"
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
    @title = "Editing: #{@show.venue} at #{@show.time}"
  end

  def create
    @show = Show.new(params[:show])
    @shows = Show.page(params[:page])
    if @show.save
      @title = "New Show: #{@show.venue}"
      respond_with @show
    else
      @title = "Please try again"
      render :new
    end
  end

  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(params[:show])
      @title = "Updated Show: #{@show.venue}"
      respond_with @show
    else
      @title = "Please try again"
      render :edit
    end
  end

  def destroy
    @shows = Show.page(params[:page])
    @show = Show.find(params[:id])
    @title = "#{@show.venue} Show Removed"
    @show.destroy
    respond_with @shows
  end
end
