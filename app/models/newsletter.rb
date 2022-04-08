# frozen_string_literal: true

class Newsletter < ApplicationRecord
  validates :message, presence: true
  validates :title, presence: true
  has_many_attached :images
end
