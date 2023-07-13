# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc).limit(6)
  end
end
