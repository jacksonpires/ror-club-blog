# frozen_string_literal: true
class Author < ApplicationRecord
  has_many :posts

  has_one_attached :avatar_image
end
