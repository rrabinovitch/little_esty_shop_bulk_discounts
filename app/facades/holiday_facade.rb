class HolidayFacade
  def initialize
    @holiday_service = HolidayService.new
  end

  def self.get_next_three_holidays
    binding.pry
  end
end
