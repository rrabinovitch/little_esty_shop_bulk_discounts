class HolidayService < ApiService
  def self.holidays
    # grabs and returns the raw JSON response from the API endpoint
    endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/US'
    get_data(endpoint)
  end
end
