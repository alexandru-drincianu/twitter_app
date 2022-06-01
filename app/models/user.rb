class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    scope :name_starts_with, ->(str) {where("name LIKE :prefix", prefix: "#{str}%")}
    
    # validates :age, presence: true
    # validates :age, numericality: { only_integer: true , in: 0..100 }
    # validates :gender, presence: true
    # validates :phone_number, presence: true
    # validates :phone_number, numericality: true

    has_many :posts, dependent: :destroy
    has_many :follower_relationships, class_name:'Relationship', foreign_key: "follower_id", dependent: :destroy
    has_many :followed_relationships, class_name:'Relationship', foreign_key: "followed_id", dependent: :destroy

    has_many :following, through: :follower_relationships, source: :followed
    has_many :followers, through: :followed_relationships, source: :follower

    has_many :likes, dependent: :destroy

    has_one_attached :avatar

    has_secure_password

    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        following.delete(other_user)
    end

    def following?(other_user)
        following.include?(other_user)
    end
end
