class HolidayFacade
  def self.next_three_holidays
    next_three_holidays_data = get_holidays_data[0..2]
    next_three_holidays = next_three_holidays_data.map do |holiday_data|
      Holiday.new(holiday_data)
    end
  end

  def self.get_holidays_data
    holidays_data = HolidayService.holidays
  end
end
