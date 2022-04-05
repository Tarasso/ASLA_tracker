class ChangeOrganizationIDtoBusinessProfessionalId < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_business_professionals, :organization_id, :business_professional_id
  end
end
