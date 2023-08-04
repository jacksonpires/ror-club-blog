# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])
    @other_posts = Post.all.take(3)
  end
end
