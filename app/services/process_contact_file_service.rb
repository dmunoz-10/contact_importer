# frozen_string_literal: true

require 'csv'

class ProcessContactFileService
  def initialize(log_file_id)
    @log_file = LogFile.find(log_file_id)
    @file_url = ActiveStorage::Blob.service.path_for(@log_file.csv.key)
  end

  def call
    @log_file.processing!
    CSV.foreach(@file_url, headers: true).with_index(1) do |row, index|
      @log_file.contacts.create!(data_parsed(@log_file.data_mapped, row))
    rescue ActiveRecord::RecordInvalid => e
      @log_file.upload_errors.create(details: e, upload_row: index)
    end

    failed_all_contacts? ? @log_file.failed! : @log_file.terminated!
  end

  private

  def failed_all_contacts?
    !@log_file.contacts.exists? && @log_file.upload_errors.exists?
  end

  def data_parsed(data_mapped, data)
    {
      user_id: @log_file.user_id,
      name: data[data_mapped['name']],
      birth_date: data[data_mapped['birth_date']],
      phone_number: data[data_mapped['phone_number']],
      address: data[data_mapped['address']],
      credit_card: data[data_mapped['credit_card']],
      email: data[data_mapped['email']]
    }
  end
end
