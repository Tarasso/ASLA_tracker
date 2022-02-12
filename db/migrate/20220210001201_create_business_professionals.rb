class CreateBusinessProfessionals < ActiveRecord::Migration[6.1]
  def change
    create_table :business_professionals do |t|
      t.string :org_name
      t.string :first_name
      t.string :last_name
      t.string :phone_num
      t.string :email

      t.timestamps
    end
  end
end
