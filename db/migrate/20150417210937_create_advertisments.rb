class CreateAdvertisments < ActiveRecord::Migration
  def change
    create_table :advertisments do |t|
      t.string :title
      t.text :copy
      t.integer :price

      t.timestamps null: false
    end
  end
end
