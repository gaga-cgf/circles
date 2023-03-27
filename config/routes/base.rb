# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq-stat'
  # get '/', to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :users do
    member do
      get :blogs
    end
  end
  resources :sessions
  resources :blogs
  namespace :admin do
    root 'users#index'
    resources :users do
      collection do
        get :search
      end
    end
  end
end
