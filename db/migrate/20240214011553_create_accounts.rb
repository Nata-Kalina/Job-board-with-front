class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :location
      t.string :about
      t.string :role
      t.string :linkedin

      t.timestamps
    end
  end
end
