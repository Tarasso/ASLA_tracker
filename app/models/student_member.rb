# frozen_string_literal: true

class StudentMember < ApplicationRecord
  has_many :event
  has_many :event_student_member
  has_many :member_attendance
  enum member_title: { member: 1, officer: 2 }
  enum program_level: { BLA1: 1, BLA2: 2, BLA3: 3, BlA4: 4, MLA1: 5, MLA2: 6, MLA3: 7 }
  enum student_classification: { freshman: 1, sophomore: 2, junior: 3, senior: 4, super_senior: 5, graduate_student: 6 }
  validates :uin, :first_name, :last_name, :class_year, :email, :program_level, :student_classification, presence: true

  validates :uin, format: { with: /\A[0-9]{9}\z/, message: 'should be a 9 digit number' }
  validates :class_year, format: { with: /\A[0-9]{4}\z/, message: 'should be in the form of YYYY' }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z ,.'-]+\z/, message: 'contains invalid characters' }

  validates :phone_number, phone: true

  before_save :normalize_phone
  after_create :update_google_params, :set_defaults

  def update_google_params
    self.uid = User.where(email: email).pick(:uid)
    self.picture = User.where(email: email).pick(:avatar_url)
    # self.picture = session[:picture]
    save!
  end

  def normalize_phone
    self.phone_number = Phonelib.parse(phone_number).full_e164.presence
  end

  def formatted_phone
    parsed_phone = Phonelib.parse(phone_number)
    return phone_number if parsed_phone.invalid?

    formatted =
      if parsed_phone.country_code == '1'
        parsed_phone.full_national
      else
        parsed_phone.full_international
      end
    formatted.gsub!(';', ' x')
    formatted
  end

  def set_defaults
    self.member_title ||= 1
    self.social_point_amount = 0
    self.meeting_point_amount = 0
    self.fundraiser_point_amount = 0
    self.informational_point_amount = 0
    self.dues_paid = 0
    self.total_points = 0
    save!
  end

  class << self
    def search(query)
      rel = order('id')
      rel = rel.where("CONCAT_WS(' ', first_name, last_name) LIKE ?", "%#{query}%") if query.present?
      rel
    end
  end
end
