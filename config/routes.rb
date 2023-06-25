# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :administrate do
    get "/", to: "posts#index"
    resources :posts
  end

  get "/inicio", to: "welcome#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
