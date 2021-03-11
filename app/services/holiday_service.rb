class HolidayService < ApiService
  def self.holidays
    endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/US'
    get_data(endpoint)
  end
end
