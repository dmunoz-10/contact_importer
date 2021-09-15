# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UploadErrors', type: :request do
  let!(:user) { create(:user) }
  let!(:log_file) { create(:log_file, user: user) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'must render the index template' do
      get log_file_upload_errors_path(log_file)

      expect(response).to render_template(:index)
    end
  end
end
