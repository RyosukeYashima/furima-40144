class CreateItems < ActiveRecord::Migration[7.0]

  
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_burden_id, null: false
      t.integer :shipping_from_id, null: false
      t.integer :days_to_ship_id, null: false

      t.timestamps
    end
  end
end
