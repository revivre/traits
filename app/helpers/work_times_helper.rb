module WorkTimesHelper
  def start_time_exists?
    WorkTime.last.start_time.nil? === false
  end
end
