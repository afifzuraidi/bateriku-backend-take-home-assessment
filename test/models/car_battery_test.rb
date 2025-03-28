require "test_helper"

class CarBatteryTest < ActiveSupport::TestCase
  setup do
    @battery = car_batteries(:acdelco_professional)
  end

  test "fixtures should be valid" do
    assert @battery.valid?
  end

  test "should require brand" do
    @battery.brand = nil
    assert_not @battery.valid?
    assert_equal [ "can't be blank" ], @battery.errors[:brand]
  end

  test "should require model" do
    @battery.model = nil
    assert_not @battery.valid?
    assert_equal [ "can't be blank" ], @battery.errors[:model]
  end

  test "voltage should be positive integer" do
    @battery.voltage = -1
    assert_not @battery.valid?
    @battery.voltage = 12.5
    assert_not @battery.valid?
    @battery.voltage = 12
    assert @battery.valid?
  end

  test "price should be positive integer" do
    @battery.price = -1
    assert_not @battery.valid?
    @battery.price = 180.99
    assert_not @battery.valid?
    @battery.price = 180
    assert @battery.valid?
  end

  test "warranty should be positive integer" do
    @battery.warranty = -1
    assert_not @battery.valid?
    @battery.warranty = 42.5
    assert_not @battery.valid?
    @battery.warranty = 42
    assert @battery.valid?
  end
end
