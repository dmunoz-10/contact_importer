# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportContactsJob, type: :job do
  let!(:user) { create(:user) }
  let!(:log_file) { create(:log_file, user: user) }

  describe '#perform_later' do
    it 'proccess the contacts file' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        ImportContactsJob.perform_later(log_file.id)
      }.to have_enqueued_job.with(log_file.id)
    end
  end
end
