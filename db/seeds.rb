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
  Admin.find_or_create_by(email: email) do |admin|
    admin.name = name
    admin.password = ENV["DEFAULT_PASSWORD"]
    admin.password_confirmation = ENV["DEFAULT_PASSWORD"]
  end
end

puts "==== Administradores cadastrados com sucesso! ===="



puts "==== Cadastrando Usuário ================="

User.find_or_create_by(email: "user@user.com") do |user|
  user.password = ENV["DEFAULT_PASSWORD"]
  user.password_confirmation = ENV["DEFAULT_PASSWORD"]
end

puts "==== Usuário cadastrado com sucesso! ===="
