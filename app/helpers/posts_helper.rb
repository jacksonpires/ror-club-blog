# frozen_string_literal: true
module PostsHelper
  def cover_image_fallback(post)
    post.cover_image.attached? ? post.cover_image.variant(:thumb) : "posts/post1.jpg"
  end
end
