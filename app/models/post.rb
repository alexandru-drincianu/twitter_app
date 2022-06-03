class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true,  length: { maximum: 120 }

  has_one_attached :picture

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
