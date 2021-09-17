# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LogFilesHelper, type: :helper do
  let!(:log_file) { build(:log_file) }

  describe '#color_status' do
    context 'when status is on hold' do
      it 'must return the color dark' do
        log_file.status = 0
        expect(color_status(log_file.status.to_sym)).to eq('dark')
      end
    end

    context 'when status is processing' do
      it 'must return the color primary' do
        log_file.status = 1
        expect(color_status(log_file.status.to_sym)).to eq('primary')
      end
    end

    context 'when status is failed' do
      it 'must return the color danger' do
        log_file.status = 2
        expect(color_status(log_file.status.to_sym)).to eq('danger')
      end
    end

    context 'when status is terminated' do
      it 'must return the color success' do
        log_file.status = 3
        expect(color_status(log_file.status.to_sym)).to eq('success')
      end
    end
  end
end
