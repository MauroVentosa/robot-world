class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :location
  has_many :car_parts, :dependent => :delete_all
  after_commit :inspect_car, on: :create

  def isCompleted
    self.location.terminal
  end

  private

  def inspect_car
    robot_guard = RobotGuard.new
    robot_guard.inspect_car(id)
  end
end
