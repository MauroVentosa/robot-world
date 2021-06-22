class RobotGuard
  $SLACK_NOTIFICATIONS_ENDPOINT = "https://hooks.slack.com/services/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"

  def call(job, time)
    quality_control_batch
  end

  def inspect_car(car_id)
    quality_control_notification(car_id)
  end

  private

  def quality_control_batch()
    cars = Car.joins(:location).where(location: { terminal: true })

    cars.each do |car|
      quality_control_single(car)
    end
  end

  def quality_control_notification(car_id)
    car = Car.find(car_id)
    quality_control_single(car)
  end

  def quality_control_single(car)
    defects = car.car_parts.select { |cp| cp.defect == true }

    if (defects.present?)
      notify_car_defects(car, defects)
      repairsLocation = Location.find_by(build_order: car.location.build_order + 1)
      car.location = repairsLocation
      car.save
    else
      transfer_stock_to_store(car)
    end
  end

  def notify_car_defects(car, defects)
    defectPartNames = defects.map { |d| d.part.name }

    options = {
      :headers => { "Content-Type": "application/json" },
      :body => { :text => "Defects have been found on Car #{car.id}. Parts affected are: #{defectPartNames.inspect}}" }.to_json,
    }

    HTTParty.post($SLACK_NOTIFICATIONS_ENDPOINT, options)
  end

  def transfer_stock_to_store(car)
    storeCar = StoreCar.new(price: car.price, costPrice: car.costPrice, year: car.year, car_model: car.car_model)
    storeCar.save
    Car.destroy(car.id)
  end
end
