10.times do |i|
  u = User.create(email: "teste#{i}@teste.com",
                  password: '123123',
                  password_confirmation: '123123')

  5.times do
    Restaurant.create(name: Faker::Company.name,
                      address: Faker::Address.street_address,
                      user: u)
  end
end

User.create(email: 'admin@admin.com', password: '123123', password_confirmation: '123123', admin: true)
