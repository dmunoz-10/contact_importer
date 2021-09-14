class CreateLogFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :log_files do |t|
      t.references :user, null: false, foreign_key: true
      t.string :data_mapped
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
