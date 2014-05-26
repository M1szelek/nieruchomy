class CreateOfferAttachments < ActiveRecord::Migration
  def change
    create_table :offer_attachments do |t|
      t.integer :offer_id
      t.string :image

      t.timestamps
    end
  end
end
