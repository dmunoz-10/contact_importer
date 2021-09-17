# frozen_string_literal: true

require 'csv'

module ApplicationHelper
  include Pagy::Frontend

  def csv_file(file_path, headers: true)
    CSV.read(file_path, headers: headers)
  end

  def find_row_csv(csv, index)
    csv.find.with_index(1) { |_p, i| i == index }&.to_hash
  end
end
