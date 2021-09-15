# frozen_string_literal: true

class ImportContactsJob < ApplicationJob
  queue_as :default

  def perform(log_file_id)
    ProcessContactFileService.new(log_file_id).call
  end
end
