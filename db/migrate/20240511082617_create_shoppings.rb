class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true


      

      t.timestamps
    end
  end
end
