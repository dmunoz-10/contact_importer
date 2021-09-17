# frozen_string_literal: true

class ContactsController < ApplicationController
  def new; end

  def create
    @log_file = current_user.log_files
                            .new(csv: params[:contacts_file],
                                 data_mapped: params[:contacts])
    if @log_file.save
      ImportContactsJob.perform_later(@log_file.id)
      redirect_to(root_path, notice: 'The contacts are being imported!')
    else
      render :new, alert: @log_file.errors.full_messages.to_sentence
    end
  end
end
