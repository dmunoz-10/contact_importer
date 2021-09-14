# frozen_string_literal: true

require 'csv'

class ImportContactsJob < ApplicationJob
  queue_as :default

  def perform(log)
    ProcessContactFileService.new(log).call
  end
end
