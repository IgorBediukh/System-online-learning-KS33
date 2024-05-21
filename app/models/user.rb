# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_one :business_model
  has_many :enrollments
  has_many :business_models, through: :enrollments
  has_many :user_lessons
  has_many :lessons, through: :user_lessons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Додати атрибут role
  enum role: { user: 0, admin: 1 }
  attribute :role, :integer

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= 1 if email.ends_with?('@karazin.ua')
    self.role ||= 0
  end
end
