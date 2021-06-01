class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.integer :user_id
    	t.string :title
    	t.string :shop_name
    	t.string :business_hours
    	t.string :url
    	t.text :body
    	t.string :address
    	t.string :image_id
      t.timestamps
    end
  end
end
