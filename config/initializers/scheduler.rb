require "rufus-scheduler"

scheduler = Rufus::Scheduler.singleton

# Robot Builder
#scheduler.every "1m", RobotBuilder.new(RobotBuilder::DEFAULT)

# Robot Builder cleanup
#scheduler.every "1d", RobotBuilder.new(RobotBuilder::END_OF_DAY)

# Robot Guard Schedule
#scheduler.every "1m", RobotGuard.new

# Random amount of order changes per hour
#scheduler.every "1h", RobotChanger.new
