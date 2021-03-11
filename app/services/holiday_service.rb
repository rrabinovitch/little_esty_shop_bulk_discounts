require './app/poros/holiday'

class HolidayService < ApiService
  def self.holidays
    endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/US'
    get_data(endpoint)
    # json_data = Holiday.new(json).next_three_holidays
  end
end
