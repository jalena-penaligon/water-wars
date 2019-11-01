require 'rails_helper'

describe "Users API" do
  it "sends a list of users" do
    user1 = User.create(email: "email@example.com")
    user2 = User.create(email: "email2@example.com")

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body)
    expect(users.count).to eq(2)
  end

  it "shows their total water log" do
    User.destroy_all
    user1 = User.create(email: "email@example.com")
    user2 = User.create(email: "email2@example.com")
    wl1 = user1.water_logs.create(oz: 10)
    wl2 = user1.water_logs.create(oz: 5)
    wl3 = user1.water_logs.create(oz: 1)
    wl4 = user2.water_logs.create(oz: 16)
    wl5 = user2.water_logs.create(oz: 5)
    get '/api/v1/users'
    binding.pry

    expect(response).to be_successful
    users = JSON.parse(response.body)
    expect(users.count).to eq(2)
  end
end
