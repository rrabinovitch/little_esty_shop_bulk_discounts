class BulkDiscountsController < ApplicationController
  before_action :find_merchant, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  before_action :find_discount, only: [:edit, :update]

  def index
    @bulk_discounts = BulkDiscount.all
  end

  def show
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def new
    @bulk_discount = BulkDiscount.new
  end

  def create
    @bulk_discount = @merchant.bulk_discounts.new(bulk_discount_params)
    if @bulk_discount.save
      flash.notice = "Successfully Added New Bulk Discount Info!"
      redirect_to merchant_bulk_discounts_path(@merchant)
    else
      flash.notice = "All fields must be completed, get your act together."
      redirect_to new_merchant_bulk_discount_path(@merchant)
    end
  end

  def destroy
    BulkDiscount.destroy(params[:id])
    redirect_to merchant_bulk_discounts_path(@merchant)
  end

  def edit
  end

  def update
    if @bulk_discount.update(bulk_discount_params)
      flash.notice = "Successfully Updated Bulk Discount Info!"
      redirect_to merchant_bulk_discount_path(@merchant, @bulk_discount)
    else
      flash.notice = "All fields must be completed, get your act together."
      redirect_to edit_merchant_bulk_discount_path(@merchant, @bulk_discount)
    end
  end

  private

  def bulk_discount_params
    params.require(:bulk_discount).permit(:name, :discount, :threshold)
  end

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_discount
    @bulk_discount = BulkDiscount.find(params[:id])
  end
end
