module ApplicationHelper

  def calculate_days(arrival,departure)
    if arrival == "" || departure == ""
      flash[:alert] = "Dates in blanck"
      0
    else
      date_arrival = arrival.split('/').map(&:to_i)
      a = Time.new(date_arrival[2],date_arrival[0],date_arrival[1])
      date_departure = departure.split('/').map(&:to_i)
      d = Time.new(date_departure[2],date_departure[0],date_departure[1])
      days = d.day - a.day
    end
  end

end
