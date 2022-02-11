class StudentMember < ApplicationRecord
    enum member_title: [:member, :officer]
end
