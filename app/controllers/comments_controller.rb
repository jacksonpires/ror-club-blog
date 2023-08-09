# frozen_string_literal: true
class CommentsController < ApplicationController

  # post_id: "fd991a50-2a2b-4e07-9500-b01f4c1be37c"

  def index
    post = Post.find_by(id: params[:post_id] )
    puts post.comments.inspect
    puts "=================="
  end
end
