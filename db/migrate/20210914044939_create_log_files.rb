class CreateLogFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :log_files do |t|
      t.references :user, null: false, foreign_key: true
      t.jsonb :data_mapped, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
