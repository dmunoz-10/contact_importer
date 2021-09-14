# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pagy, @files_imported = pagy(current_user.log_files.order(:id), items: 10) if user_signed_in?
  end
end
