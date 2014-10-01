class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.references :manager
      t.timestamps
    end
  end
end
