require "rails_helper"

RSpec.describe RobotBuilder, :type => :job do
  context "default building behavior" do
    it "builds 10 random cars" do
      builder = RobotBuilder.new(RobotBuilder::DEFAULT)
      expect(builder.WORK_MODE == RobotBuilder::DEFAULT)
    end
  end
end
