# frozen_string_literal: true
module PostsHelper
  def cover_image_fallback(post, variant = :thumb)
    post.cover_image.attached? ? post.cover_image.variant(variant) : "posts/post1.jpg"
  end

  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end
end
