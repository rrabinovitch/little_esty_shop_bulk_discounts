class BulkDiscountsController < ApplicationController
  before_action :find_merchant

  def index
    @bulk_discounts = BulkDiscount.all
  end

  def show
  end

  def new
  end

  def create
    BulkDiscount.create!(name: params[:name],
                         discount: params[:discount],
                         threshold: params[:discount],
                         id: find_new_id, merchant: @merchant)
    redirect_to merchant_bulk_discounts_path(@merchant.id)
  end

  private
  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_new_id
    BulkDiscount.last.id + 1
  end
end
