# frozen_string_literal: true

FactoryBot.define do
  factory :log_file do
    user { nil }
    status { 1 }
  end
end
