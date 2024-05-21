# frozen_string_literal: true

# app/controllers/registrations_controller.rb
class LessonsController < ApplicationController
  def destroy
    Lesson.destroy(params[:id])
    redirect_to business_model_path(params[:business_model_id])
  end
end
