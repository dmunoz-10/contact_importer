# frozen_string_literal: true

class LogFile < ApplicationRecord
  enum status: %i[on_hold processing failed terminated]

  belongs_to :user
  has_many :contacts
  has_many :upload_errors
  has_one_attached :csv, dependent: :destroy
end
