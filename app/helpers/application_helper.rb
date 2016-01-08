module ApplicationHelper
  def format_date(date)
    return nil unless date
    date.strftime('%m/%d') + '(' + day_letter(date.wday) + ')'
  end

  def format_time(date)
    return nil unless date
    date.strftime('%H:%M')
  end

  def day_letter(day)
    I18n.t('date.abbr_day_names')[day % 7].first
  end

  def check_holiday(work_date, first_day, last_day)
    if (HolidayJp.between(first_day, last_day).has_key?(work_date))
      return true
    else
      return false
    end
  end
end
