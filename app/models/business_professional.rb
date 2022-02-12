# frozen_string_literal: true

class BusinessProfessional < ApplicationRecord
  validates :org_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_num, presence: true
  validates :email, presence: true
end
