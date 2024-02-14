class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :categoty
      t.boolean :remote
      t.float :salary
      t.text :requirements
      t.text :responsibilities
      t.date :application_deadline

      t.timestamps
    end
  end
end
