# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LogFiles', type: :request do
  let!(:user) { create(:user) }
  let!(:log_file) { create(:log_file, :data_example, user: user) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'must returns http success and render the new template' do
      get new_log_file_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when params are ok' do
      it 'must create the log file' do
        params = {
          log_file: { csv: fixture_file_upload('files/csv/data_example.csv'),
                      data_mapped: attributes_for(:log_file)[:data_mapped] }
        }
        post log_files_path, params: params

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when params are wrong' do
      it 'must not create the log file' do
        params = {
          log_file: { csv: fixture_file_upload('files/csv/data_example.csv'),
                      data_mapped: nil }
        }
        post log_files_path, params: params

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET /show' do
    it 'must render the show template' do
      get log_file_path(log_file)

      expect(response).to render_template(:show)
    end
  end
end
