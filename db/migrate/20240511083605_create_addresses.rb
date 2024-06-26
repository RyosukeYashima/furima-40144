class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.string :post_code, null: false
      t.string :building_name
      t.integer :shipping_from_id, null: false
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :phone_number, null: false
      t.references :shopping, null: false, foreign_key: true


      t.timestamps
    end
  end
end
