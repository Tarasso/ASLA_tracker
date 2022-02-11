# frozen_string_literal: true

json.array!(@student_members, partial: 'student_members/student_member', as: :student_member)
