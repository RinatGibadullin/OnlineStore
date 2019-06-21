class RemoveCategoryFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category, :String
  end
end
