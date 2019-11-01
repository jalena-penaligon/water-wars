require 'rails_helper'

describe "Water Log API" do
  it "can create new oz's for a user" do
    user = User.create(email: "email@email.com")
    body =  {email: 'email@email.com', oz: 15}

    post "/api/v1/users/water", params: body

    expect(response).to be_successful
    users = JSON.parse(response.body)

    expect(users[user.email]).to eq(15)

    body =  {email: 'email@email.com', oz: 5}
    post "/api/v1/users/water", params: body
    users = JSON.parse(response.body)
    expect(users[user.email]).to eq(20)
  end
end
