class Holiday
  def initialize(holiday_data)
    @name = holiday_data[:name]
    @date = holiday_data[:date]
  end

  # def next_three_holidays
  #   holidays = ""
  #
  #   @data.each do |holiday|
  #     holidays += "#{holiday[:name]}, #{holiday[:date]}"
  #   end
  #   holidays = holidays[0..-2]
  # end
end
