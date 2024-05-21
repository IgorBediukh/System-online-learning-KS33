# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  def start_teaching
    @user = User.find(params[:user_id])

    return if @user.role == 0

    model = BusinessModel.find(params[:model_id])
    model.user = @user
    model.save

    redirect_to '/'
  end
end
