class RobotBuilder
  $INITIAL_ASSEMBLY_LINE_ORDER = 0
  $ROBOT_WORLD_FACTORY_NAME = "Robot World Factory"
  @WORK_MODE
  WORK_MODES = [DEFAULT = 0, END_OF_DAY = 1]

  def initialize(mode = RobotBuilder::DEFAULT)
    @WORK_MODE = mode
  end

  def call(job, time)
    if @WORK_MODE == WORK_MODES[RobotBuilder::DEFAULT]
      buildCarBatch
    else
      cleanup
    end
  end

  def cleanup()
    Car.destroy_all
  end

  private

  def buildCarBatch()
    carModels = CarModel.all
    locations = Factory.find_by(name: $ROBOT_WORLD_FACTORY_NAME).locations
    parts = Part.all

    10.times do |i|
      aCarModel = carModels.sample
      initialLocation = locations.detect { |l| l.build_order == $INITIAL_ASSEMBLY_LINE_ORDER }

      newCar = Car.new(year: 2021, price: 10000, costPrice: 8000, car_model: aCarModel, location: initialLocation)

      while not newCar.isCompleted
        assembleCarPerLocation(newCar, parts)
        nextAssembyLineLocation = locations.detect { |l| l.build_order == newCar.location.build_order + 1 }
        newCar.location = nextAssembyLineLocation
      end

      newCar.save
    end
  end

  def assembleCarPerLocation(car, parts)
    partsToAsseble = parts.select { |part| part.location == car.location }

    partsToAsseble.each do |part|
      car.car_parts << CarPart.new(car: car, part: part, defect: rand < 0.05)
    end
  end
end
