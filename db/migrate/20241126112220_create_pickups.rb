class CreatePickups < ActiveRecord::Migration[7.1]
  def change
    create_table :pickups do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.boolean :status
      t.string :address

      t.timestamps
    end
  end
end
