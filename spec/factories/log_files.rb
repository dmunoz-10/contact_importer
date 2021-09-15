# frozen_string_literal: true

FactoryBot.define do
  factory :log_file do
    user { nil }
    data_mapped { FFaker::Lorem.sentence }
    status { LogFile.statuses.values.sample }
  end
end
