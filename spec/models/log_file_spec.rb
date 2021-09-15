# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogFile, type: :model do
  describe 'User validation' do
    it 'must exist' do
      log_file = build(:log_file)
      log_file.save
      expect(log_file.errors[:user]).to include('must exist')
    end
  end

  describe 'Data mapped validation' do
    it 'must exist' do
      log_file = build(:log_file, data_mapped: nil)
      log_file.save
      expect(log_file.errors[:data_mapped]).to include("can't be blank")
    end
  end
end
