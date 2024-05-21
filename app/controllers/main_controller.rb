# frozen_string_literal: true

class MainController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @business_models = BusinessModel.all
  end
end
