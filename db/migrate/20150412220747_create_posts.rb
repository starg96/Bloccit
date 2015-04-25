class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end

    create_table :summaries do |t|
    	t.belongs_to :post, index: true
    	t.string :title
    	t.timestamps null: false
    end
  end
end
