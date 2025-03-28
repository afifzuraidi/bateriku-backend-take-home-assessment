require "test_helper"

class AuthorizedCarBatteriesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      email: "test@example.com",
      password: "password",
      jti: SecureRandom.uuid
    )
    @headers = auth_headers(@user)
    @acdelco = car_batteries(:acdelco_professional)
    @bosch = car_batteries(:bosch_s4)
  end

  test "should show car battery" do
    get car_battery_url(@acdelco), headers: @headers
    assert_response :success
    battery = JSON.parse(response.body)
    assert_equal @acdelco.brand, battery["brand"]
    assert_equal @acdelco.model, battery["model"]
  end

  test "should create car battery with valid params" do
    assert_difference("CarBattery.count") do
      post car_batteries_url,
           params: {
             car_battery: {
               brand: "NewBrand",
               model: "NewModel",
               voltage: 12,
               price: 100,
               warranty: 12
             }
           }.to_json,
           headers: @headers
    end
    assert_response :created
    assert_equal "NewBrand", JSON.parse(response.body)["brand"]
  end

  test "should not create with invalid params" do
    assert_no_difference("CarBattery.count") do
      post car_batteries_url,
           params: {
             car_battery: {
               brand: "",
               model: "",
               voltage: 0,
               price: 0,
               warranty: 0
             }
           }.to_json,
           headers: @headers
    end
    assert_response :unprocessable_entity
    assert_not_empty JSON.parse(response.body)["brand"]
  end

  test "should update car battery" do
    patch car_battery_url(@bosch),
          params: { car_battery: { price: 160 } }.to_json,
          headers: @headers
    assert_response :success
    assert_equal 160, @bosch.reload.price
  end

  test "should not update with invalid data" do
    original_price = @acdelco.price
    patch car_battery_url(@acdelco),
          params: { car_battery: { price: -10 } }.to_json,
          headers: @headers
    assert_response :unprocessable_entity
    assert_equal original_price, @acdelco.reload.price
  end

  test "should destroy car battery" do
    assert_difference("CarBattery.count", -1) do
      delete car_battery_url(@acdelco), headers: @headers
    end
    assert_response :no_content
  end

  test "should return 404 for non-existent battery" do
    get car_battery_url(999), headers: @headers
    assert_response :not_found
    assert_equal ({ "error" => "Car battery not found" }), JSON.parse(response.body)
  end
end
