# frozen_string_literal: true

class StudentMember < ApplicationRecord
  enum member_title: { member: 1, officer: 2 }
  validates :uin, :first_name, :last_name, :class_year, :member_title, :email, presence: true
end
