module ApplicationHelper
  def display_hour(hour)
    if hour > 12
      "#{hour - 12} PM"
    else
      "#{hour} AM"
    end
  end
end
