require "test_helper"

class UnauthorizedCarBatteriesTest < ActionDispatch::IntegrationTest
  setup do
    @acdelco = car_batteries(:acdelco_professional)
  end

  test "should get index" do
    get car_batteries_url
    assert_response :success
    assert_not_empty JSON.parse(response.body)
  end

  test "should require auth for show" do
    get car_battery_url(@acdelco)
    assert_response :unauthorized
  end

  test "should require auth for create" do
    assert_no_difference("CarBattery.count") do
      post car_batteries_url,
           params: {
             car_battery: {
               brand: "NewBrand",
               model: "NewModel",
               voltage: 12,
               price: 100,
               warranty: 12
             }
           }.to_json
    end
    assert_response :unauthorized
  end

  test "should require auth for update" do
    original_price = @acdelco.price
    patch car_battery_url(@acdelco),
          params: { car_battery: { price: 150 } }.to_json
    assert_response :unauthorized
    assert_equal original_price, @acdelco.reload.price
  end

  test "should require auth for destroy" do
    assert_no_difference("CarBattery.count") do
      delete car_battery_url(@acdelco)
    end
    assert_response :unauthorized
  end
end
