class CreateEventBusinessProfessionals < ActiveRecord::Migration[6.1]
  def change
    create_table :event_business_professionals do |t|
      t.integer :organization_id
      t.integer :event_id

      t.timestamps
    end
  end
end
