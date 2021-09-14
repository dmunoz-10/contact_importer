# frozen_string_literal: true

class UploadError < ApplicationRecord
  belongs_to :log_file
end
