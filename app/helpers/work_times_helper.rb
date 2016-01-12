module WorkTimesHelper
  def check_holiday(check_date, start_date, end_date)
    if HolidayJapan.between(start_date, end_date).key?(check_date)
      return true
    else
      return false
    end
  end

  def holiday_name(date)
    HolidayJapan.name(date)
  end

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
end
