# frozen_string_literal: true

FactoryBot.define do
  factory :upload_error do
    log_file { nil }
    details { FFaker::Lorem.sentence }
    upload_row { 1 }
  end
end
