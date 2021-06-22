class UnitSalesController < ApplicationController
  include Response
  # GET /unit_sales
  def index
    @unitSales = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count()
    json_response(@unitSales)
  end
end
