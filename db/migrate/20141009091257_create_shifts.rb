class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :employee
      t.float :latitude
      t.string :start_time
      t.string :end_time
      t.string :date
      t.string :shift_hours
      t.string :address
      t.float :longitude
      t.string :status
      t.timestamps
    end
  end
end
