# frozen_string_literal: true
# The controller to maintain user details authentication and authorization

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate_user!
  before_action :check_admin, only: [:destroy]

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      redirect_to @user, notice: 'User was not updated.'
    end
  end

  def destroy
    @user.destroy
    Rails.logger.info "Failed to destroy user: #{@user.errors.full_messages}"
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end

  # Check if the current user is an admin
  def check_admin
    redirect_to(root_url) unless current_user.admin?
  end
end
