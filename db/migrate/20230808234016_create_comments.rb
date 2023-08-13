# frozen_string_literal: true
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table(:comments, id: :uuid) do |t|
      t.references(:user, null: true, foreign_key: true, type: :uuid)
      t.references(:post, null: false, foreign_key: true, type: :uuid)
      t.text(:body)

      t.timestamps
    end
  end
end
