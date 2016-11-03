FactoryGirl.define do
  factory :post do
    #add associations, see fundsy
    sequence(:title){|n| "Blog Title #{n}"}
    body {Faker::Hipster.paragraph}
  end
end
