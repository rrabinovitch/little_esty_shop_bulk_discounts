require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
    @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')

    @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")

    @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 10, unit_price: 10, status: 2)
    @ii_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 1, unit_price: 10, status: 1)

    @discount_1 = BulkDiscount.create!(name: "Going Out of Business", discount: 0.2, threshold: 10, merchant: @merchant1)
  end

  describe "validations" do
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
  end

  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many :transactions}
    it { should have_many :invoice_items}
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:merchants).through(:items) }
  end

  describe "instance methods" do
    it "#total_revenue_before_discount" do
      expect(@invoice_1.total_revenue_before_discount).to eq(110.0)
    end
    
    it "#total_revenue_after_discount" do
      expect(@invoice_1.total_revenue_after_discount).to eq(90.0)
    end
  end
end
