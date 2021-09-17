# frozen_string_literal: true

class Contact < ApplicationRecord
  VALID_PHONE_NUMBER_REGEXP = /\(\+\d{2}\) (\d{3} \d{3} \d{2} \d{2}|\d{3}-\d{3}-\d{2}-\d{2})/.freeze
  VALID_BIRTH_DATE_FORMAT = %w[%Y%m%d %F].freeze

  belongs_to :user
  belongs_to :log_file

  validates_presence_of :name, :birth_date, :phone_number, :address, :credit_card, :email
  validates :name,
            format: { with: /\A[a-zA-Z\s\-]+\z/,
                      message: 'Special characters are not allowed, except for the minus (-)' }
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEXP,
                                     message: 'The phone number format is invalid' }
  validates :email, uniqueness: { scope: :user_id }, format: { with: Devise.email_regexp }
  validate :birth_date_validation
  validate :credit_card_validation

  after_validation :save_credit_card_details

  def birth_date_formatted
    Date.parse(birth_date).strftime('%Y %B %d')
  end

  private

  def birth_date_validation
    errors.add(:birth_date, 'Invalid format') unless valid_date?
  end

  def credit_card_validation
    errors.add(:credit_card, 'Must be a valid credit card number') unless valid_credit_card?
  end

  def valid_credit_card?
    credit_card.present? && CreditCardValidations::Luhn.valid?(credit_card)
  end

  def valid_date?
    VALID_BIRTH_DATE_FORMAT.each do |format|
      return true if birth_date && Date.strptime(birth_date, format)
    rescue Date::Error
      nil
    end

    false
  end

  def save_credit_card_details
    return unless credit_card

    self.last_four_digits = credit_card[-4..]
    self.franchise = CreditCardValidations::Detector.new(credit_card).brand_name
    self.credit_card = BCrypt::Password.create(credit_card)
  end
end
