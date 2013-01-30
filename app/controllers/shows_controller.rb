class ShowsController < ApplicationController
  before_filter :signed_in_user, :except => :index

  def index
    @title = "Shows"
    @shows = Show.page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @shows }
    end
  end

  def new
    @title = "New Show"
    @show = Show.new

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @show }
    end
  end

  def edit
    @show = Show.find(params[:id])
    @title = "#{@show.time} | #{@show.venue}"
    respond_to :html, :js
  end

  def create
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to shows_url, notice: 'Show was successfully created.' }
        format.json { render json: @show, status: :created, location: shows_url }
      else
        format.html { @shows = []
                      flash.now[:notice] = "Something went wrong with your request."
                      render 'index' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to shows_url, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { @shows = []
                      flash.now[:notice] = "Something went wrong with your request."
                      render 'index' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url, notice: "Your show was removed" }
      format.json { head :no_content }
    end
  end
end
