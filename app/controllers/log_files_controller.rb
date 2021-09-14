# frozen_string_literal: true

class LogFilesController < ApplicationController
  before_action :set_log_file

  def show
    @file_url = ActiveStorage::Blob.service.path_for(@log_file.csv.key)
    @pagy, @contacts = pagy(@log_file.contacts.order(:created_at), items: 20)
    @contacts_error = @log_file.upload_errors.count.positive?
  end

  private

  def set_log_file
    @log_file = LogFile.find(params[:id])
  end
end
