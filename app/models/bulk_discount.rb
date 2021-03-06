class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  def discount_to_percentage
    (self.discount * 100).round
  end
end
