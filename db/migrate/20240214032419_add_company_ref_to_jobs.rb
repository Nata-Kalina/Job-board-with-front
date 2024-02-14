class AddCompanyRefToJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :company, foreign_key: true, null: false
  end
end
