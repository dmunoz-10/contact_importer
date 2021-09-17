# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UploadErrorsController, type: :routing do
  describe 'routing GET /' do
    it 'routes to #index' do
      expect(get: '/log_files/1/upload_errors').to route_to(
        on: :member,
        controller: 'upload_errors',
        action: 'index',
        log_file_id: '1'
      )
    end
  end
end
