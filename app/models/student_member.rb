# frozen_string_literal: true

class StudentMember < ApplicationRecord
  enum member_title: { member: 0, officer: 1 }
end
