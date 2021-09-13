class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.datetime :birth_date
      t.string :phone_number
      t.string :address
      t.string :credit_card
      t.string :franchise
      t.string :email

      t.timestamps
    end
  end
end
