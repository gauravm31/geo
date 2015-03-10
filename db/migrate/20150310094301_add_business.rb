class AddBusiness < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.float :lat
      t.float :lon
    end
  end
end
