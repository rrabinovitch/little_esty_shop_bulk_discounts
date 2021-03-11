class Holiday
  # before refactor, the Holiday PORO represented a collection of three holidays and the #next_three_holidays method returned the data we needed about all three holidays in a single string
  # now each Holiday object represents a single holiday with attributes that can be read by the view

  attr_reader :name, :date

  def initialize(holiday_data)
    @name = holiday_data[:name]
    @date = holiday_data[:date]
  end
end
