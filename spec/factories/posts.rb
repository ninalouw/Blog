FactoryGirl.define do
  factory :post do
    sequence(:title){|n| "Blog Title #{n}"}
    body {Faker::Hipster.paragraph}
  end
end
