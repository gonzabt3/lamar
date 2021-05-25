FactoryBot.define do
  factory :user do
    email { Faker::Internet.email  }
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name  }
    nickname { "test-nickname" }
    password { "test-password" }
  end
end
