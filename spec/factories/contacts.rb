# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    birth_date { FFaker::Time.datetime }
    phone_number { FFaker::PhoneNumberAU.mobile_phone_number.delete(' ') }
    address { FFaker::Address.street_address }
    credit_card { FFaker::Bank.card_type }
    franchise { FFaker::Bank.card_number }
    email { FFaker::Internet.safe_email }
  end
end
