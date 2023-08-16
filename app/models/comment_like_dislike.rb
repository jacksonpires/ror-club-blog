# frozen_string_literal: true
class CommentLikeDislike < ApplicationRecord
  belongs_to :comment
  belongs_to :user
end
