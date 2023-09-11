# frozen_string_literal: true
class AddDefaultAdmins < ActiveRecord::Migration[7.0]
  def change
    admins = {
      "hello@admin.com" => "Administrador",
      "test@admin.com" => "Teste",
    }

    admins.each do |email, name|
      Admin.find_or_create_by(email: email) do |admin|
        admin.name = name
        admin.password = ENV["DEFAULT_PASSWORD"]
        admin.password_confirmation = ENV["DEFAULT_PASSWORD"]
      end
    end
  end
end
