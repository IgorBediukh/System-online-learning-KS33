# frozen_string_literal: true

class BusinessModel < ApplicationRecord
  validates :name, presence: true
  validates :index, presence: true, numericality: { only_integer: true }

  belongs_to :user, optional: true
  belongs_to :captain, class_name: "User", optional: true
  has_many :lessons, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments
end
