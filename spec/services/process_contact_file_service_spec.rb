# frozen_string_literal: true

require 'rails_helper'
require_relative '../../app/services/process_contact_file_service'

RSpec.describe ProcessContactFileService do
  let!(:user) { create(:user) }
  let!(:log_file) { create(:log_file, :data_example, user: user) }
  let!(:log_file2) { create(:log_file, :data_example2, user: user) }
  let!(:log_file3) { create(:log_file, :data_example3, user: user) }
  let!(:log_file4) { create(:log_file, :data_example4, user: user) }

  describe '#call' do
    context 'all the data are fine' do
      it 'must create the contacts without errors' do
        ProcessContactFileService.new(log_file.id).call

        expect(log_file.contacts.count.positive?).to be(true)
        expect(log_file.upload_errors.count.zero?).to be(true)
      end
    end

    context 'some data are wrong' do
      it 'must create the contacts with some errors' do
        ProcessContactFileService.new(log_file2.id).call

        expect(log_file2.contacts.count.positive?).to be(true)
        expect(log_file2.upload_errors.count.positive?).to be(true)
      end
    end

    context 'all the data are wrong' do
      it 'must not create the contacts' do
        ProcessContactFileService.new(log_file3.id).call

        expect(log_file3.contacts.count.zero?).to be(true)
        expect(log_file3.upload_errors.count.positive?).to be(true)
      end
    end

    context 'there are no data' do
      it 'must return without any contact created and no errors' do
        ProcessContactFileService.new(log_file4.id).call

        expect(log_file3.contacts.count.zero?).to be(true)
        expect(log_file3.upload_errors.count.zero?).to be(true)
      end
    end
  end
end
