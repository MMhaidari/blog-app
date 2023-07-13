require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    photo { Faker::Avatar.image }
    bio { Faker::Lorem.sentence }
    posts_counter { 0 }
  end
end

FactoryBot.define do
  factory :post do
    title { 'hello there' }
    text { 'this is my first post' }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user

    factory :post_with_comments do
      transient do
        comments_count { 5 }
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post:)
      end
    end
  end
end

FactoryBot.define do
  factory :comment do
    text { 'Hi Tom!' }
    association :author, factory: :user
    association :post
  end
end
