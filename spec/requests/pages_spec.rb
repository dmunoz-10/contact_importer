# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /home' do
    it 'returns http success and render the home template' do
      get root_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:home)
    end
  end
end
