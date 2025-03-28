# Clear existing data
CarBattery.destroy_all
User.destroy_all

puts "Creating sample users..."
User.create!(
  email: 'user@example.com',
  password: 'password123',
  jti: SecureRandom.uuid
)

puts "Creating car batteries..."

car_batteries = [
  {
    brand: 'ACDelco',
    model: 'Professional',
    voltage: 12,
    price: 120,
    warranty: 24
  },
  {
    brand: 'Bosch',
    model: 'S4',
    voltage: 12,
    price: 150,
    warranty: 36
  },
  {
    brand: 'Optima',
    model: 'YellowTop',
    voltage: 12,
    price: 250,
    warranty: 48
  },
  {
    brand: 'DieHard',
    model: 'Gold',
    voltage: 12,
    price: 180,
    warranty: 36
  },
  {
    brand: 'Duralast',
    model: 'Platinum',
    voltage: 12,
    price: 200,
    warranty: 42
  },
  {
    brand: 'Exide',
    model: 'Edge',
    voltage: 12,
    price: 160,
    warranty: 30
  },
  {
    brand: 'Varta',
    model: 'Blue Dynamic',
    voltage: 12,
    price: 220,
    warranty: 48
  }
]

car_batteries.each do |battery|
  CarBattery.create!(battery)
  puts "Created #{battery[:brand]} #{battery[:model]}"
end

puts "Seeding completed successfully!"
puts "#{User.count} users created"
puts "#{CarBattery.count} car batteries created"
