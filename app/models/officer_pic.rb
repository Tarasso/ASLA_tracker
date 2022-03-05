# frozen_string_literal: true

class OfficerPic < ApplicationRecord
  has_one_attached :image
end
