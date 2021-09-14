class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :birth_date
      t.string :phone_number
      t.string :address
      t.string :credit_card
      t.string :last_four_digits
      t.string :franchise
      t.string :email

      t.timestamps
    end
  end
end
