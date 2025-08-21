# app/models/user.rb
class User < ApplicationRecord
  # devise は有効化しておく（current_user を使うため）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_relationships,
           class_name:  "Relationship",
           foreign_key: :follower_id,  dependent: :destroy
  has_many :passive_relationships,
           class_name:  "Relationship",
           foreign_key: :following_id, dependent: :destroy

  has_many :followings, through: :active_relationships,  source: :following
  has_many :followers,  through: :passive_relationships, source: :follower

  # 自分(current_user)が other をフォローしている？
  def following?(other)
    active_relationships.exists?(following_id: other.id)
  end

  # other にフォローされている？
  def followed_by?(other)
    passive_relationships.exists?(follower_id: other.id)
  end
end


