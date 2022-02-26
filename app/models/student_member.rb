# frozen_string_literal: true

class StudentMember < ApplicationRecord

  enum member_title: { member: 1, officer: 2 }
  validates :uin, :first_name, :last_name, :class_year, :member_title, :email, presence: true

  after_save :record_uid

  def record_uid
    self.uid = User.return_uid
    self.save
  end
end
