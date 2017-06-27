FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password'
    role 'trainer'

    transient do
      client_count { rand 10 }
    end

    after(:create) do |trainer, evaluator|
      create_list(:user, evaluator.client_count, :client, trainer: trainer)
    end

    trait :client do
      role 'client'
      client_count 0
      name { Faker::Name.name }
      image { [open(UiFaces.face), nil].sample }
    end
  end
end
