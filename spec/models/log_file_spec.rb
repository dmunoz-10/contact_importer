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

  describe 'Csv validation' do
    it 'must exist' do
      log_file = build(:log_file)
      log_file.save
      expect(log_file.errors[:csv]).to include("can't be blank")
    end

    it 'must be a csv file' do
      log_file = build(:log_file)
      log_file.csv.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'txt', 'test.txt')),
        filename: 'test.txt'
      )
      log_file.save
      expect(log_file.errors[:csv]).to include('Must be a CSV file')
    end
  end
end
