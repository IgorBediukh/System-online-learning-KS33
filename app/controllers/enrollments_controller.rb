# frozen_string_literal: true

class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  def create
    Enrollment.create(user_id: params[:user_id],business_model_id: params[:model_id])
    if current_user.admin?
      redirect_to business_model_path(params[:model_id])
    else
      redirect_to '/'
    end
  end

  def destroy
    Enrollment.destroy(params[:id])
    if current_user.admin?
      redirect_to business_model_path(params[:model_id])
    else
      redirect_to '/'
    end
  end
end
