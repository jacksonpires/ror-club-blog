# frozen_string_literal: true
namespace :dev do
  desc "Reset all the project"
  task reset: :environment do
    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")

    show_spinner("Adding Posts...") { add_posts }
  end

  desc "Add 50 new posts"
  task add_posts: :environment do
    show_spinner("Adding Posts...") { add_posts }
  end

  private

  def add_posts
    50.times do
      title = Faker::Lorem.sentence.delete(".")
      body = Faker::Lorem.paragraph(sentence_count: rand(150..200))

      Post.create!(title: title, body: body)
    end
  end

  def show_spinner(message, end_message = "Done!")
    raise "Você está em ambiente de produção!" if Rails.env.production?

    spinner = TTY::Spinner.new("[:spinner] #{message}")
    spinner.auto_spin

    yield

    spinner.stop("#{end_message}")
  end
end
