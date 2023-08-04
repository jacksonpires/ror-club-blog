# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])
  end
end
