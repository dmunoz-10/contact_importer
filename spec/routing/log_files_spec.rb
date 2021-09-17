# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogFilesController, type: :routing do
  describe 'routing GET /new' do
    it 'routes to #new' do
      expect(get: '/log_files/new').to route_to('log_files#new')
    end
  end

  describe 'routing POST /' do
    it 'routes to #create' do
      expect(post: '/log_files').to route_to('log_files#create')
    end
  end

  describe 'routing GET /:id' do
    it 'routes to #show' do
      expect(get: '/log_files/1').to route_to(controller: 'log_files', action: 'show', id: '1')
    end
  end
end
