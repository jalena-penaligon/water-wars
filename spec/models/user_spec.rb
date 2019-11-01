require "rails_helper"

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
  end

  describe "#daily_water" do
    it "should return all users and their daily water count" do
      User.destroy_all
      user1 = User.create!(email: "email@example.com")
      user2 = User.create!(email: "email2@example.com")
      wl1 = user1.water_logs.create(oz: 10)
      wl2 = user1.water_logs.create(oz: 5)
      wl3 = user1.water_logs.create(oz: 1)
      wl4 = user2.water_logs.create(oz: 16)
      wl5 = user2.water_logs.create(oz: 5)

      expect(User.daily_water).to eq({'email@example.com' => 16, 'email2@example.com' => 21})
    end
  end
end
