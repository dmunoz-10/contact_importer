# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'must returns http success and render the new template' do
      get new_contact_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when params are ok' do
      it 'must create the log file' do
        params = { contacts_file: fixture_file_upload('files/csv/data_example.csv'),
                   contacts: JSON.generate(attributes_for(:log_file)[:data_mapped]) }
        post contacts_path, params: params

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when params are wrong' do
      it 'must not create the log file' do
        post contacts_path

        expect(response).to render_template(:new)
      end
    end
  end
end
