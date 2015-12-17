class City < ActiveRecord::Base

  has_many :point_of_interests

  # validates :name, presence: true
  # validates :name, length: {maximum: 40}
  # validates :name, format: {with: /\A[A-Za-zÑñ\s]+\z/}
end
