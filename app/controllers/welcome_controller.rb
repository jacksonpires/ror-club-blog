# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @posts = Post.all
  end
end
