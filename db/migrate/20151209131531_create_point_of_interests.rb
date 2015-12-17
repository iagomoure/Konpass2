class CreatePointOfInterests < ActiveRecord::Migration
  def change
    create_table :point_of_interests do |t|
      t.references :city, index: true
      t.string :name
      t.string :description
      t.string :district
      
      t.timestamps null: false
    end
  end
end
