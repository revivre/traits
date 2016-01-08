module WorkTimesHelper
  def check_holiday(check_date, start_date, end_date)
    if HolidayJapan.between(start_date, end_date).key?(check_date)
      return true
    else
      return false
    end
  end
end
