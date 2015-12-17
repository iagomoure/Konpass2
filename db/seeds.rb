(1..5).each do |index|
	PointOfInterest.create(name: "POI #{index}",description: "Description content of POI #{index}",district:"District #{index}", rating:index)
end

(1..4).each do |index|
	City.create(name: "City #{index}",description: "Description content of city #{index}")
end

(1..3).each do |index|
	Tag.create(name: "Tag #{index}")
end
