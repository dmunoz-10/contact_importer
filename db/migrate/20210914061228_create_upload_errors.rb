class CreateUploadErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :upload_errors do |t|
      t.references :log_file, null: false, foreign_key: true
      t.text :details
      t.integer :upload_row

      t.timestamps
    end
  end
end
