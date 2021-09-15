# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let!(:user) { create(:user) }

  describe 'User validation' do
    it 'must exist' do
      contact = build(:contact)
      contact.save
      expect(contact.errors[:user]).to include('must exist')
    end
  end

  describe 'Log File validation' do
    it 'must exist' do
      contact = build(:contact)
      contact.save
      expect(contact.errors[:log_file]).to include('must exist')
    end
  end

  describe 'Name validation' do
    it 'must exist' do
      contact = build(:contact, user: user, name: nil)
      contact.save
      expect(contact.errors[:name]).to include("can't be blank")
    end

    it 'must be valid' do
      error_message = 'Special characters are not allowed, except for the minus (-)'
      contact = build(:contact, user: user, name: 'invalid/name')
      contact.save
      expect(contact.errors[:name]).to include(error_message)
    end
  end

  describe 'Birth date validation' do
    it 'must exist' do
      contact = build(:contact, user: user, birth_date: nil)
      contact.save
      expect(contact.errors[:birth_date]).to include("can't be blank")
    end

    it 'must have a valid format' do
      contact = build(:contact, user: user, birth_date: '05-22-2000')
      contact.save
      expect(contact.errors[:birth_date]).to include('Invalid format')
    end
  end

  describe 'Phone number validation' do
    it 'must exist' do
      contact = build(:contact, user: user, phone_number: nil)
      contact.save
      expect(contact.errors[:phone_number]).to include("can't be blank")
    end

    it 'must have a valid format' do
      contact = build(:contact, user: user, phone_number: '+32 3131 3131 31')
      contact.save
      expect(contact.errors[:phone_number]).to include('The phone number format is invalid')
    end
  end

  describe 'Address validation' do
    it 'must exist' do
      contact = build(:contact, user: user, address: nil)
      contact.save
      expect(contact.errors[:address]).to include("can't be blank")
    end
  end

  describe 'Credit card validation' do
    it 'must exist' do
      contact = build(:contact, user: user, credit_card: nil)
      contact.save
      expect(contact.errors[:credit_card]).to include("can't be blank")
    end
  end

  describe 'Last four digits validation' do
    it 'must exist' do
      contact = build(:contact, user: user, credit_card: nil)
      contact.save
      expect(contact.errors[:last_four_digits]).to include("can't be blank")
    end
  end

  describe 'Franchise validation' do
    it 'must exist' do
      contact = build(:contact, user: user, credit_card: nil)
      contact.save
      expect(contact.errors[:franchise]).to include("can't be blank")
    end
  end

  describe 'Email validation' do
    it 'must exist' do
      contact = build(:contact, user: user, email: nil)
      contact.save
      expect(contact.errors[:email]).to include("can't be blank")
    end

    it 'must have a valid format' do
      contact = build(:contact, user: user, email: 'example/email.com')
      contact.save
      expect(contact.errors[:email]).to include('is invalid')
    end

    it 'must be unique' do
      contact = create(:contact, user: user)
      contact2 = build(:contact, user: user, email: contact.email)
      contact2.save
      expect(contact2.errors[:email]).to include('has already been taken')
    end
  end
end
