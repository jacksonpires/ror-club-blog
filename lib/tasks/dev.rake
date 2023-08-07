# frozen_string_literal: true
namespace :dev do
  desc "Reset all the project"
  task reset: :environment do
    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
    system("rails dev:add_categories")
    system("rails dev:add_authors")
    system("rails dev:add_posts")
  end

  desc "Add categories"
  task add_categories: :environment do
    show_spinner("Adding Categories...") { add_categories }
  end

  desc "Add authors"
  task add_authors: :environment do
    show_spinner("Adding Authors...") { add_authors }
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

  def add_authors
    5.times do
      author = Author.create!(
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph(sentence_count: rand(10..30)),
        facebook_profile_url: Faker::Internet.url(host: "facebook.com"),
        instagram_profile_url: Faker::Internet.url(host: "instagram.com"),
        twitter_profile_url: Faker::Internet.url(host: "twitter.com"),
        linkedin_profile_url: Faker::Internet.url(host: "linkedin.com"),
        youtube_profile_url: Faker::Internet.url(host: "youtube.com"),
      )

      image_id = rand(1..5)

      author.avatar_image.attach(
        io: File.open("#{Rails.root}/lib/tasks/images/avatar-#{image_id}.png"),
        filename: "author #{image_id}",
      )
    end
  end

  def add_posts
    50.times do
      title = Faker::Lorem.sentence.delete(".")
      body = Faker::Lorem.paragraph(sentence_count: rand(150..200))
      category = Category.all.sample
      author = Author.all.sample

      post = Post.create!(
        title: title,
        body: body,
        category: category,
        author: author,
        created_at: [true, false].sample ? Time.now - rand(1..60).days : Time.now + rand(1..60).days,
      )

      image_id = rand(1..5)

      post.cover_image.attach(
        io: File.open("#{Rails.root}/lib/tasks/images/0#{image_id}.jpg"),
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
