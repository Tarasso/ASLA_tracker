# frozen_string_literal: true

class OfficerPic < ApplicationRecord
  validates :name, presence: true
  validates :officer_title, presence: true
  has_one_attached :image
end
