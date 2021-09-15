# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  has_many :log_files

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validates :password, length: { minimum: 6 }, presence: true, on: :create
end
