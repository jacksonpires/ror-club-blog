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

    comment_like_dislike = CommentLikeDislike.find_or_initialize_by(
      comment_id: params[:id],
      user_id: current_user.id,
    )

    if comment_like_dislike.new_record?
      comment_like_dislike.save!
      Comment.find(params[:id]).increment!(:like)
      redirect_to(post_path(post), notice: "Registramos o seu like!")
    else
      message = "Não foi possível registrar o seu like!"
      message = "Você já registrou o seu like/dislike!" if !comment_like_dislike.new_record?

      redirect_to(post_path(post), alert: message)
    end
  end

  def dislike
    post = Post.friendly.find(params[:post_id])

    comment_like_dislike = CommentLikeDislike.find_or_initialize_by(
      comment_id: params[:id],
      user_id: current_user.id,
    )

    if comment_like_dislike.new_record?
      comment_like_dislike.save!
      Comment.find(params[:id]).increment!(:dislike)
      redirect_to(post_path(post), notice: "Registramos o seu dislike!")
    else
      message = "Não foi possível registrar o seu dislike!"
      message = "Você já registrou o seu like/dislike!" if !comment_like_dislike.new_record?

      redirect_to(post_path(post), alert: message)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge({ user: current_user })
  end
end
