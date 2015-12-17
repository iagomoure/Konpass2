class AddSerializeToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :images, :string
  end
end
