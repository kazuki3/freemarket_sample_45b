FactoryBot.define do
  factory :user, class: User do
    email                 {"test_user@gmail.com"}
    nickname              {"mercari"}
    password              {"000000"}
    password_confirmation {"000000"}
  end


end
