module ApplicationHelper
  def format_date(date)
    return nil unless date
    date.strftime('%m/%d(%a)')
  end
  def format_time(date)
    return nil unless date
    date.strftime('%H:%M')
  end
end
