# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    user { nil }
    name { FFaker::Name.name }
    birth_date { FFaker::Time.date }
    phone_numbers = ['(+12) 345 678 90 12', '(+12) 345-678-90-12']
    phone_number { phone_numbers.sample }
    address { FFaker::Address.street_address }
    credit_card { CreditCardValidations::Factory.random }
    email { FFaker::Internet.safe_email }
  end
end
