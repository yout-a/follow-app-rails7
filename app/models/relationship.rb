# app/models/relationship.rb
class Relationship < ApplicationRecord
  belongs_to :follower,  class_name: "User"
  belongs_to :following, class_name: "User"

  validates :follower_id,  presence: true
  validates :following_id, presence: true
  validates :following_id, uniqueness: { scope: :follower_id } # 同じ組み合わせを禁止

  validate :cannot_follow_self
  def cannot_follow_self
    errors.add(:following_id, "can't be same as follower") if follower_id == following_id
  end
end

