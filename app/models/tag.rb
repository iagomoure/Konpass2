class Tag < ActiveRecord::Base

  has_many :point_of_interests, through: :poi_tags
end
