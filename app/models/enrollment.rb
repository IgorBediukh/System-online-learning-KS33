# frozen_string_literal: true
class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :business_model
end