# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let!(:file_path) { Rails.root.join('spec', 'fixtures', 'files', 'csv', 'data_example.csv') }
  let!(:csv_reader) { csv_file(file_path) }

  describe 'csv_file method' do
    it 'must return the csv reader' do
      expect(csv_reader.class).to be(CSV::Table)
    end
  end

  describe 'find_row_csv method' do
    context 'the index exist' do
      it 'must return a hash' do
        row = find_row_csv(csv_reader, 1)
        expect(row.class).to be(Hash)
      end
    end

    context "the index doesn't exist" do
      it 'must return nil' do
        row = find_row_csv(csv_reader, 22)
        expect(row.nil?).to be(true)
      end
    end
  end
end
