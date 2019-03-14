FactoryBot.define do
  factory :user do

    password = Faker::Internet.password(8)
    nickname                  {Faker::Pokemon.name}
    email                     {Faker::Internet.free_email}
    password                  {password}
    password_confirmation     {password}
    self_introduction         {"こんにちは"}

  end
end
