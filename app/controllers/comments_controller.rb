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

  def like
    post = Post.friendly.find(params[:post_id])

    if Comment.find(params[:id]).increment!(:like)
      redirect_to(post_path(post), notice: "Registramos o seu like!")
    else
      redirect_to(post_path(post), alert: "Não foi possível registrar o seu like!")
    end
  end

  def dislike
    post = Post.friendly.find(params[:post_id])

    if Comment.find(params[:id]).increment!(:dislike)
      redirect_to(post_path(post), notice: "Registramos o seu dislike!")
    else
      redirect_to(post_path(post), alert: "Não foi possível registrar o seu dislike!")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({ user: current_user })
  end
end
