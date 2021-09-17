# frozen_string_literal: true

class LogFilesController < ApplicationController
  before_action :set_log_file, only: :show

  def new
    @log_file = LogFile.new
  end

  def create
    @log_file = current_user.log_files.new(log_file_params)
    if @log_file.save
      ImportContactsJob.perform_later(@log_file.id)
      redirect_to(root_path, notice: 'The contacts are being imported!')
    else
      render :new, alert: @log_file.errors.full_messages.to_sentence
    end
  end

  def show
    @pagy, @contacts = pagy(@log_file.contacts.order(:created_at), items: 20)
    @contacts_error = @log_file.upload_errors.exists?
  end

  private

  def set_log_file
    @log_file = current_user.log_files.find(params[:id])
  end

  def log_file_params
    params.require(:log_file).permit(:csv, data_mapped: {})
  end
end
