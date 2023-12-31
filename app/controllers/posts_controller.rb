# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.all, items: 9)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @other_posts = Post.all.take(3)
    @comments = order_comments_by
  end

  def category
    @category = Category.find_by(id: params[:id])
    @pagy, @posts = pagy(@category.posts, items: 9)
  end

  private

  def order_comments_by
    return @post.comments.order(created_at: :asc) if params[:order_by] == "more_recents"

    @post.comments.order(created_at: :desc)
  end
end
