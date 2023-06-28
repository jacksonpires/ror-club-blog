# frozen_string_literal: true
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :cover_image do |attachable|
    attachable.variant(:thumb, resize_to_limit: [100, 100])
    attachable.variant(:cover, resize_to_limit: [200, 200])
  end
end
