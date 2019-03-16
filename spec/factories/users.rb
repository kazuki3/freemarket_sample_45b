FactoryBot.define do
<<<<<<< HEAD
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
=======


  factory :user, class: User do
    email                 {"test_user@gmail.com"}
    nickname              {"mercari"}
    password              {"000000"}
    password_confirmation {"000000"}
>>>>>>> kazuki3/master
  end


end
