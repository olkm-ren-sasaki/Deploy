class RemoveUserIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :user_, :integer
  end
end
