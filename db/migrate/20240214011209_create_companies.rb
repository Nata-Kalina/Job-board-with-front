class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.text :about
      t.text :benefits
      t.string :industry
      t.string :website
      t.string :location
      t.string :email
      t.string :phone
      t.string :linkedin

      t.timestamps
    end
  end
end
