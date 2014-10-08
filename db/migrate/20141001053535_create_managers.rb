class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :company_name
      t.string :company_email
      t.string :company_phone
      t.timestamps
    end
  end
end
