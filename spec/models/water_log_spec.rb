require "rails_helper"

describe WaterLog, type: :model do
  describe "validations" do
    it {should validate_presence_of(:oz)}
    it {should belong_to(:user)}
  end

  describe "#daily_ozs" do
    it "should calculate todays water intake" do
      user1 = User.create!(email: "email@example.com")
      wl1 = user1.water_logs.create(oz: 10)
      wl2 = user1.water_logs.create(oz: 5)
      wl3 = user1.water_logs.create(oz: 1)

      expect(WaterLog.todays_ozs(user1.id)).to eq(16)
    end

    it "should not include yesterdays water" do
      user1 = User.create!(email: "email@example.com")
      wl1 = user1.water_logs.create(oz: 10, created_at: 1.day.ago)
      wl2 = user1.water_logs.create(oz: 5)
      wl3 = user1.water_logs.create(oz: 1)

      expect(WaterLog.todays_ozs(user1.id)).to eq(6)
    end
  end
end
