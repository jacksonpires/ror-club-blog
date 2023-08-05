# frozen_string_literal: true
module AuthorsHelper
  def avatar_image_fallback(author)
    author.avatar_image.attached? ? author.avatar_image : "avatar/man-1.svg"
  end
end
