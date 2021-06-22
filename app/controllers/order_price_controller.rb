class OrderPriceController < ApplicationController
  include Response
  # GET /order_price
  def index
    @averageOrderValue = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).joins(:store_car).average(:price)
    json_response(@averageOrderValue)
  end
end
