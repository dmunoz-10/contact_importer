# frozen_string_literal: true

class UploadError < ApplicationRecord
  belongs_to :log_file

  validates :upload_row, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
