class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :resume
      t.string :cover_letter
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
