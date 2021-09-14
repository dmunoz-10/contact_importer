# frozen_string_literal: true

class UploadErrorsController < ApplicationController
  before_action :set_log_file

  def index
    @file_path = ActiveStorage::Blob.service.path_for(@log_file.csv.key)
    @pagy, @upload_errors = pagy(@log_file.upload_errors.order(:created_at), items: 10)
    @data_mapped = JSON.parse(@log_file.data_mapped)
  end

  private

  def set_log_file
    @log_file = LogFile.find(params[:log_file_id])
  end
end
