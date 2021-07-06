FactoryBot.define do
  factory :course do
    name { ['Ruby', 'Ruby on Rails', 'JavaScript'].sample }
    description { 'Um curso de Ruby' }
    sequence(:code) { |n| "RUBYBASIC#{n}" }
    price { rand(10..100) }
    enrollment_deadline { 1.year.from_now }
    instructor

    trait :expired do
      enrollment_deadline { 2.days.ago }
    end
  end
end
