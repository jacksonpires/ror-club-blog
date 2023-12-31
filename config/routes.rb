# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :administrate do
    get "/", to: "dashboards#index"

    resources :categories do
      member do
        delete "destroy_cover_image"
      end
    end

    resources :authors

    resources :posts do
      member do
        delete "destroy_cover_image"
      end
    end
  end

  resources :posts, only: [:index, :show] do
    member do
      get :category
    end
    resources :comments do
      member do
        post "like"
        post "dislike"
      end
    end
  end

  resources :categories, only: [:index]

  get "/inicio", to: "welcome#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
