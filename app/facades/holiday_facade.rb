class HolidayFacade

  def self.next_three_holidays
    # filters JSON response for data re: next 3 holidays
    next_three_holidays_data = get_holidays_data[0..2]

    # turns data into collection of POROs that represent the next 3 holidays
    next_three_holidays = next_three_holidays_data.map do |holiday_data|
      # holiday_data block variable references data for a single holiday, which is used to initialize a Holiday PORO
      Holiday.new(holiday_data)
    end
    # return value: an array of Holiday POROs
  end

  def self.get_holidays_data
    # grabs raw JSON response from HolidayService
    HolidayService.holidays
  end
end
