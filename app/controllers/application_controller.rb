# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user_admin?
    current_user&.admin?
  end

  helper_method :current_user_admin? # Зробити метод доступним у всіх представленнях
end
