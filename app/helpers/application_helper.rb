module ApplicationHelper
  def display_hour(hour)
    if hour.to_i > 12
      "#{hour - 12} PM"
    else
      "#{hour} AM"
    end
  end
end
