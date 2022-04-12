class AddOfficerBioToOfficerPics < ActiveRecord::Migration[6.1]
  def change
    add_column :officer_pics, :officer_bio, :string
  end
end
