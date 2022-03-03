class AddUidToBusinessProfessional < ActiveRecord::Migration[6.1]
  def change
    add_column :business_professionals, :uid, :string
  end
end
