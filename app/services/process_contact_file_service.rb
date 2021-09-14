require 'csv'

class ProcessContactFileService
  def initialize(log_file)
    @log_file = log_file
    @file_url = ActiveStorage::Blob.service.path_for(log_file.csv.key)
  end

  def call
    @log_file.processing!
    rows = CSV.read(@file_url, headers: true).count
    if rows.zero?
      @log_file.terminated!
      return
    end

    errors_counter = 0
    CSV.foreach(@file_url, headers: true).with_index do |row, index|
      contact = Contact.new(data_parsed(JSON.parse(@log_file.data_mapped),
                                        row.to_hash,
                                        @log_file))
      contact.save!
    rescue ActiveRecord::RecordInvalid => e
      UploadError.create(log_file: @log_file, details: e, upload_row: index)
      errors_counter += 1
    end

    errors_counter == rows ? @log_file.failed! : @log_file.terminated!
  end

  private

  def data_parsed(data_mapped, data, log_file)
    {
      user_id: log_file.user_id,
      log_file_id: log_file.id,
      name: data[data_mapped['name']],
      birth_date: data[data_mapped['birth_date']],
      phone_number: data[data_mapped['phone_number']],
      address: data[data_mapped['address']],
      credit_card: data[data_mapped['credit_card']],
      email: data[data_mapped['email']]
    }
  end
end
