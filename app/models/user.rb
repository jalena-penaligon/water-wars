class User < ApplicationRecord
  has_many :water_logs, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  def self.daily_water
    self.all.each_with_object({}) do |user, memo|
      memo[user.email] = WaterLog.todays_ozs(user.id)
    end
  end
end
