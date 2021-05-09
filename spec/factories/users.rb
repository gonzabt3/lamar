FactoryBot.define do
  factory :user do
    email { "test-email@gmail.com" }
    name { "test-name" }
    surname { "test-username" }
    nickname { "test-nickname" }
  end
end
