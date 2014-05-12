class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :typeM
      t.string :photo
      t.string :street
      t.string :city
      t.string :state
      t.string :metrage
      t.integer :roomcount
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :offers, [:user_id, :created_at]
  end
end
