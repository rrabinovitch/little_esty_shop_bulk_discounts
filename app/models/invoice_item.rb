class InvoiceItem < ApplicationRecord
  validates_presence_of :invoice_id,
                        :item_id,
                        :quantity,
                        :unit_price,
                        :status

  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_one :customer, through: :invoice
  has_many :transactions, through: :invoice
  has_many :bulk_discounts, through: :merchant

  enum status: [:pending, :packaged, :shipped]

  def self.incomplete_invoices
    invoice_ids = InvoiceItem.where("status = 0 OR status = 1").pluck(:invoice_id)
    Invoice.order(created_at: :asc).find(invoice_ids)
  end

  def revenue
    if applicable_discount.nil?
      (unit_price * quantity).to_f
    else
      revenue = (unit_price * quantity).to_f
      revenue - (revenue * (applicable_discount.first.to_f))
    end
  end

  def applicable_discount
    bulk_discounts
    .where('? >= threshold', self.quantity)
    .order(discount: :desc, threshold: :desc)
    .pluck(:discount, :id)
    .first
  end
end
