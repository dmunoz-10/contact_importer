# frozen_string_literal: true

class ContactsController < ApplicationController
  def new; end

  def create
    log_file = current_user.log_files
                           .create(csv: params[:contacts_file],
                                   data_mapped: params[:contacts].to_json)
    ImportContactsJob.perform_now(log_file)
    redirect_to(root_path, notice: 'The contacts are being imported!')
  end
end
