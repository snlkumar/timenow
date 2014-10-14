class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :emp_code
      t.string :designation
      t.string :phone
      t.references :manager
      t.timestamps
    end
  end
end
