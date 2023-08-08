# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :posts

  has_one_attached :cover_image
end
