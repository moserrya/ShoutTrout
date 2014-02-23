FactoryGirl.define do
  
  factory :inbound_message do
    from { "+1#{Faker::Number.number(10)}" }
    to   { "+1#{Faker::Number.number(10)}" }
    text { Faker::Lorem.words(10 - Kernel.rand(10)).join(' ') }
  end

  factory :subscription do
  end

  factory :user do
    name { Faker::Name.name }
    phone_number { Faker::Number.number(10) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :user_with_messages do
      ignore do
        messages_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:inbound_message, evaluator.messages_count, user: user, from: user.phone_number)
      end
    end

    factory :user_with_subscription do
      after(:create) do |user, evaluator|
        create(:subscription, user: user)
      end
    end
  end

  factory :contact do
    user
    name { Faker::Name.name }
    phone_number { Faker::Number.number(10) }
  end
end
