class Lesson < ApplicationRecord
  belongs_to :business_model
  has_many :user_lessons, dependent: :destroy
  has_many :users, through: :user_lessons
end
