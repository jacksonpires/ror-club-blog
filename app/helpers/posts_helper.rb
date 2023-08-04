# frozen_string_literal: true
module PostsHelper
  def cover_image_fallback(post, variant = :thumb)
    post.cover_image.attached? ? post.cover_image.variant(variant) : "posts/post1.jpg"
  end
end
