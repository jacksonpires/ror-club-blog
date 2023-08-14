# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.friendly.find(params[:post_id])

    comment = post.comments.new(comment_params)

    if comment.save
      redirect_to(post_path(post), notice: "Comentário criado com sucesso!")
    else
      redirect_to(post_path(post), alert: "Comentário não foi criado! - #{comment.errors.full_messages.join(", ")}")
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({ user: current_user })
  end
end
