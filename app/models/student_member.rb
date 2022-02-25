# frozen_string_literal: true

class StudentMember < ApplicationRecord
  enum member_title: { member: 1, officer: 2 }
  validates :uin, :first_name, :last_name, :class_year, :email, presence: true

  after_create :update_google_params

  def update_google_params
    self.uid = User.where("email = ?", self.email).first.getUID
    # TODO:
    # self.picture
    self.save
  end

end
