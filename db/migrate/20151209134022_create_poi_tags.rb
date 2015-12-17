class CreatePoiTags < ActiveRecord::Migration
  def change
    create_table :poi_tags do |t|
      t.references :point_of_interest, index: true
      t.references :tag, index: true
      t.timestamps null: false
    end
  end
end
