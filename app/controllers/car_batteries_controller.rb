class CarBatteriesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    @car_batteries = CarBattery.all
    render json: @car_batteries
  end

  def show
    @car_battery = CarBattery.find_by(id: params[:id])

    if @car_battery
      render json: @car_battery
    else
      render json: { error: "Car battery not found" }, status: :not_found
    end
  end

  def create
    @car_battery = CarBattery.new(car_battery_params)
    if @car_battery.save
      render json: @car_battery, status: :created
    else
      render json: @car_battery.errors, status: :unprocessable_entity
    end
  end

  def update
    @car_battery = CarBattery.find(params[:id])
    if @car_battery.update(car_battery_params)
      render json: @car_battery
    else
      render json: @car_battery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @car_battery = CarBattery.find(params[:id])
    @car_battery.destroy
    head :no_content
  end

  private

  def car_battery_params
    params.require(:car_battery).permit(:brand, :model, :voltage, :price, :warranty)
  end
end
