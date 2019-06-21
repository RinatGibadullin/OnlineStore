class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :amount
      t.decimal :price

      t.timestamps
    end
  end
end
