class AddRatingToPointOfInterest < ActiveRecord::Migration
  def change
    add_column :point_of_interests, :rating, :integer
  end
end
