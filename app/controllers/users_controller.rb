class UsersController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user

  def edit
    @user = User.find(params[:id])
    @title = "Account"
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { sign_in @user
                      redirect_to :home, notice: 'Account updated successfully.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def correct_user
    @user = User.find(params[:id])
    redirect_to :home unless current_user?(@user)
  end
end
