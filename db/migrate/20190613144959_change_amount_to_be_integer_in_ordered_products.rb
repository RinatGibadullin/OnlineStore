class ChangeAmountToBeIntegerInOrderedProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :ordered_products, :amount, :integer
  end
end
