class CreateOfficerPics < ActiveRecord::Migration[6.1]
  def change
    create_table :officer_pics do |t|
      t.string :name
      t.string :officer_title

      t.timestamps
    end
  end
end
