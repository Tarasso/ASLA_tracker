# frozen_string_literal: true

class BusinessProfessional < ApplicationRecord
  validates :org_name, :first_name, :last_name, :phone_num, :email, presence: true

  validates :org_name, :first_name, :last_name, format: { with: /\A[a-zA-Z0-9 ,.'-]+\z/, message: 'contains invalid characters' }

  validates :phone_num, phone: true

  before_save :normalize_phone
  after_create :update_google_params

  def update_google_params
    self.uid = User.where(email: email).pick(:uid)
    self.picture = User.where(email: email).pick(:avatar_url)
    save!
  end

  def normalize_phone
    self.phone_num = Phonelib.parse(phone_num).full_e164.presence
  end

  def formatted_phone
    parsed_phone = Phonelib.parse(phone_num)
    return phone_num if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == '1'
        parsed_phone.full_national
      else
        parsed_phone.full_international
      end
    formatted.gsub!(';', ' x')
    formatted
  end
end
