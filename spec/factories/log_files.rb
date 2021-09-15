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

    after(:build) do |log_file|
      log_file.csv.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example.csv')),
        filename: 'data_example.csv'
      )
    end
  end
end
