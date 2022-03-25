# frozen_string_literal: true

json.array!(@business_attendances, partial: 'business_attendances/business_attendance', as: :business_attendance)
