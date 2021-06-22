class RobotBuyer
  def call(job, time)
    buy_cars
  end

  private

  def buy_cars()
    models = CarModel.all

    rand(1..10).times do
      model = models.sample
      carToBuy = StoreCar.where(:ordered => false).where(:car_model => model).first
      if (not carToBuy.present?)
        Rails.logger.info "Unable to satisfy order demand of Robot Buyer for model: #{model.name}"
      else
        newOrder = Order.new(client: "Robot Buyer", store_car: carToBuy)
        newOrder.save
        carToBuy.ordered = true
        carToBuy.save
      end
    end
  end
end
