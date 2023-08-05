# frozen_string_literal: true
class AddAuthorToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference(:posts, :author, null: true, foreign_key: true, type: :uuid)
  end
end
