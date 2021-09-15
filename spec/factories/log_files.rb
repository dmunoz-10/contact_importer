# frozen_string_literal: true

FactoryBot.define do
  factory :log_file do
    user { nil }
    data_mapped do
      {
        name: 'First Name',
        birth_date: 'Date of Birth',
        phone_number: 'Phone',
        address: 'Address',
        credit_card: 'Credit Card',
        email: 'Email'
      }.to_json
    end
    status { LogFile.statuses.values.sample }

    trait :data_example do
      after(:build) do |log_file|
        log_file.csv.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example.csv')),
          filename: 'data_example.csv'
        )
      end
    end

    trait :data_example2 do
      after(:build) do |log_file|
        log_file.csv.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example_2.csv')),
          filename: 'data_example_2.csv'
        )
      end
    end

    trait :data_example3 do
      after(:build) do |log_file|
        log_file.csv.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example_3.csv')),
          filename: 'data_example_3.csv'
        )
      end
    end

    trait :data_example4 do
      after(:build) do |log_file|
        log_file.csv.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example_4.csv')),
          filename: 'data_example_4.csv'
        )
      end
    end
  end
end
