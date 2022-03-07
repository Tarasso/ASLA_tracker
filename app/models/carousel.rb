# frozen_string_literal: true

class Carousel < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :pic_name, presence: true
end
