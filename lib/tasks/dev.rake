# frozen_string_literal: true
namespace :dev do
  desc "Add new posts"
  task add_posts: :environment do
    50.times do
      title = Faker::Lorem.sentence.delete(".")
      body = Faker::Lorem.paragraph(sentence_count: rand(150..200))

      Post.create!(title: title, body: body)
    end
  end
end
