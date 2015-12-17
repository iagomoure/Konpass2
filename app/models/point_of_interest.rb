class PointOfInterest < ActiveRecord::Base

  belongs_to :city
  has_many :tags, through: :poi_tags

  validates :name, presence: true
  validates :name, length: {maximum: 40}
  # validates :name, format: {with: /\A[A-Za-zÑñ\s]+\z/}
  # validates :name, format: {with: /\A[0-5]+\z/}
  serialize :images, Array

  def self.district_by_rating(pointsofinterest)
    district_points = pointsofinterest.reduce({}) do |memo, point|
      memo[point.district] = [] unless memo[point.district]
      memo[point.district] << point #return undefined
      memo #return memo for the reduce method
    end
    avg_district(district_points)
  end

  def self.avg_district(district_points)
    districts = district_points.map do |key, value|
      avg = value.reduce(0.0){|m, p|  m + p.rating} / value.size
      {points: value, district: key, rating: avg}
    end

    districts.sort do |a, b|
      b[:rating] <=> a[:rating]
    end
  end

end
