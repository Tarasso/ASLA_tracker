class ChangeOrganizationIDtoBusinessProfessionalIdForAttendance < ActiveRecord::Migration[6.1]
  def change
    rename_column :business_attendances, :organization_id, :business_professional_id
  end
end
