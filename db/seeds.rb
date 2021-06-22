# Models
# Factory
factory = Factory.create(name: "Robot World Factory")

# Locations
basic = Location.create(name: "Basic structure", factory: factory, terminal: false, build_order: 0)
electronics = Location.create(name: "Electronic devices", factory: factory, terminal: false, build_order: 1)
paintingAndDetails = Location.create(name: "Painting and final details", factory: factory, terminal: false, build_order: 2)
warehouse = Location.create(name: "Factory Warehouse", factory: factory, terminal: true, build_order: 3)
repairs = Location.create(name: "Repairs ", factory: factory, terminal: false, build_order: 4)

# Car Models
CarModel.create(name: "Model A")
CarModel.create(name: "Model B")
CarModel.create(name: "Model C")
CarModel.create(name: "Model D")
CarModel.create(name: "Model E")
CarModel.create(name: "Model F")
CarModel.create(name: "Model G")
CarModel.create(name: "Model H")
CarModel.create(name: "Model I")

# Parts 4 wheels, 1 chassis, 1 laser, 1 computer, 1 engine, price, cost price and 2 seats.
Part.create(name: "Wheel", location: basic)
Part.create(name: "Chassis", location: basic)
Part.create(name: "Engine", location: basic)
Part.create(name: "Laser", location: electronics)
Part.create(name: "Computer", location: electronics)
Part.create(name: "Seat", location: paintingAndDetails)
