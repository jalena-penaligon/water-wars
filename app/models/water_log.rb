class WaterLog < ApplicationRecord
  belongs_to :user
  validates :oz, presence: true, numericality: true

  def self.todays_ozs(user_id)
    where(user_id: user_id)
    .where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    .sum(:oz)
  end
end
