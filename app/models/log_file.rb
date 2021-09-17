# frozen_string_literal: true

class LogFile < ApplicationRecord
  enum status: %i[on_hold processing failed terminated]

  belongs_to :user
  has_many :contacts
  has_many :upload_errors
  has_one_attached :csv, dependent: :destroy

  validates_presence_of :data_mapped, :csv
  validate :correct_csv_file

  private

  def correct_csv_file
    errors.add(:csv, 'Must be a CSV file') if csv.attached? && !csv.content_type.in?('text/csv')
  end
end
