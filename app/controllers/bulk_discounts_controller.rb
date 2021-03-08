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
  end

  def create
    BulkDiscount.create!(name: params[:name],
                         discount: params[:discount],
                         threshold: params[:discount],
                         id: find_new_id, merchant: @merchant)
    redirect_to merchant_bulk_discounts_path(@merchant.id)
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
    params.require(:bulk_discount).permit(:name, :discount, :threshold, :merchant_id)
  end

  def find_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def find_new_id
    BulkDiscount.last.id + 1
  end

  def find_discount
    @bulk_discount = BulkDiscount.find(params[:id])
  end
end
