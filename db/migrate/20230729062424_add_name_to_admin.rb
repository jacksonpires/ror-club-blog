# frozen_string_literal: true
class AddNameToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column(:admins, :name, :string)
  end
end
