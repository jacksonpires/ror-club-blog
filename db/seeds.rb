# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "==== Cadastrando Administradores ================="

admins = {
  "admin@admin.com" => "Administrador",
  "test@test.com" => "Teste",
}

admins.each do |email, name|
  Admin.create!(
    email: email,
    name: name,
    password: ENV["DEFAULT_PASSWORD"],
    password_confirmation: ENV["DEFAULT_PASSWORD"],
  )
end

puts "==== Administradores cadastrados com sucesso! ===="
