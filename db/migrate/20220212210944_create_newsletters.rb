class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :message
      t.string :title

      t.timestamps
    end
  end
end
