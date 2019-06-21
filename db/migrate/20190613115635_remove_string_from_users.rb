class RemoveStringFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :String, :string
  end
end
