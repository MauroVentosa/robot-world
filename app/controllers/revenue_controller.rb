class RevenueController < ApplicationController
  include Response
  # GET /revenue
  def index
    @revenue = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).joins(:store_car).sum("store_cars.price")
    json_response(@revenue)
  end
end
