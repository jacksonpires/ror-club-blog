# frozen_string_literal: true
namespace :dev do
  desc "Reset all the project"
  task reset: :environment do
    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
    system("rails dev:add_categories")
    system("rails dev:add_posts")
  end

  desc "Add categories"
  task add_categories: :environment do
    show_spinner("Adding Categories...") { add_categories }
  end

  desc "Add 50 new posts"
  task add_posts: :environment do
    show_spinner("Adding Posts...") { add_posts }
  end

  private

  def add_categories
    categories = %w(Frontend Backend Linux MacOs Docker)
    categories.each do |category|
      Category.create!(name: category)
    end
  end

  def add_posts
    50.times do
      title = Faker::Lorem.sentence.delete(".")
      body = Faker::Lorem.paragraph(sentence_count: rand(150..200))
      category = Category.all.sample

      post = Post.create!(title: title, body: body, category: category)

      image_id = rand(1..3)

      post.cover_image.attach(
        io: File.open("#{Rails.root}/lib/tasks/images/post#{image_id}.jpg"),
        filename: "post #{image_id}",
      )
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
