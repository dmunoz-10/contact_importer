# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LogFiles', type: :request do
  let!(:user) { create(:user) }
  let!(:log_file) { create(:log_file, user: user) }

  before do
    sign_in user
  end

  describe 'GET /show' do
    it 'must render the show template' do
      get log_file_path(log_file)

      expect(response).to render_template(:show)
    end
  end
end
