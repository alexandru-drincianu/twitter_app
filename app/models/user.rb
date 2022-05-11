class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :age, presence: true
    validates :age, numericality: { only_integer: true , in: 0..100 }
    validates :gender, presence: true
    validates :phone_number, presence: true
    validates :phone_number, numericality: true

    has_secure_password
end
