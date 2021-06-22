class RobotChanger
  def call(job, time)
    orders = Order.all
    models = CarModel.all
    orderChanges = orders.map { |o| { :order_id => o.id, :new_model => models.select { |m| not m == o.store_car.car_model }.sample } }
    rand(1..5).times do
      randomOrder = orders.sample
      change_order(randomOrder.id, models.select { |m| not m == randomOrder.store_car.car_model }.sample)
    end
  end

  private

  def change_order(order_id, new_car_model)
    availableCar = StoreCar.where(:ordered => false).where(:car_model => new_car_model).first

    if (not availableCar.present?)
      Rails.logger.info "Unable to satisfy order change for model: #{new_car_model.name} and Order: #{order_id}"
    else
      order = Order.find(order_id)

      oldCar = order.store_car
      oldCar.ordered = false
      oldCar.save

      order.store_car = availableCar
      order.save
    end
  end
end
