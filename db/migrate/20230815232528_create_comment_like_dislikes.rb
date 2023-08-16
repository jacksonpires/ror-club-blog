# frozen_string_literal: true
class CreateCommentLikeDislikes < ActiveRecord::Migration[7.0]
  def change
    create_table(:comment_like_dislikes, id: :uuid) do |t|
      t.references(:comment, null: false, foreign_key: true, type: :uuid)
      t.references(:user, null: false, foreign_key: true, type: :uuid)

      t.timestamps
    end
  end
end
