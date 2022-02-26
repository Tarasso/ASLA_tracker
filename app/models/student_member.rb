# frozen_string_literal: true

class StudentMember < ApplicationRecord

  enum member_title: { member: 1, officer: 2 }
  validates :uin, :first_name, :last_name, :class_year, :email, presence: true

  after_create :update_google_params

  def update_google_params
    self.uid = (User.find_by "email = ?", self.email)
    puts "RIP"
    puts (User.find_by "email = ?", self.email)
    # TODO
    # self.picture
    self.save
  end

end
