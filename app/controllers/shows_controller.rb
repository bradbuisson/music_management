class ShowsController < ApplicationController

  def index
    @title = "Shows"
    @shows = Show.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @shows }
    end
  end

  def show
    @show = Show.find(params[:id])
    @title = "#{@show.venue} on #{@show.date} at #{@show.time}"

    respond_to do |format|
      format.html
      format.json { render json: @show }
    end
  end
end
