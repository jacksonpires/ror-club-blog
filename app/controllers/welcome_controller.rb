# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc).limit(6)
    @categories = Category.all.take(8)
  end
end
