# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogFile, type: :model do
  describe 'User validation' do
    it 'must exist' do
      contact = build(:log_file)
      contact.save
      expect(contact.errors[:user]).to include('must exist')
    end
  end
end
