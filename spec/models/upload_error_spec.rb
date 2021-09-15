# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UploadError, type: :model do
  describe 'Log File validation' do
    it 'must exist' do
      upload_error = build(:upload_error)
      upload_error.save
      expect(upload_error.errors[:log_file]).to include('must exist')
    end
  end

  describe 'Upload row validation' do
    it 'must exist' do
      upload_error = build(:upload_error, upload_row: nil)
      upload_error.save
      expect(upload_error.errors[:upload_row]).to include("can't be blank")
    end

    it 'must be greater than or equal to zero' do
      upload_error = build(:upload_error, upload_row: -1)
      upload_error.save
      expect(upload_error.errors[:upload_row]).to include('must be greater than or equal to 0')
    end
  end
end
