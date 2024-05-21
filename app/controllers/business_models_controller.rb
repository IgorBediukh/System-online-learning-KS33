# frozen_string_literal: true

class BusinessModelsController < ApplicationController
  def show
    @business_model = BusinessModel.find(params[:id])
    @captain = User.find(@business_model.captain_id) if @business_model.captain_id
    registered_user_ids = @business_model.enrollments.pluck(:user_id)
    @registered_users = User.where(role: 0).where(id: registered_user_ids)
    @unregistered_users = User.where(role: 0).where.not(id: registered_user_ids)
  end

  def create
    @business_model = BusinessModel.new(business_model_params)
    index = BusinessModel.last&.index || 0
    @business_model.index = index + 1
    if @business_model.save
      redirect_to '/'
    end
  end

  def update
    @business_model = BusinessModel.find(params[:id])
    @business_model.captain_id = params[:captain_id]
    @business_model.save
  end

  def destroy
    BusinessModel.destroy(params[:id])
    redirect_to '/'
  end

  private

  def business_model_params
    params.require(:business_models).permit(:name)
  end
end
