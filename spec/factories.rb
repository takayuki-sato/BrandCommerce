FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@brandcommerce.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  factory :player do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:description) { |n| "Product #{n}" }
  end

  factory :item do
    description "Lorem ipsum"
    url "http:www.brandcommerce.com"
    player
  end
end