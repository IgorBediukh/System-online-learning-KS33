# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :users, only: [:show] do
    post 'start_teaching'
  end
  resources :enrollments, only: [:create, :destroy]
  resources :business_models
  resources :user_lessons, only: [:index, :update, :create]
  resources :lessons, only: [:destroy]
  root 'main#index', as: 'home'

end
