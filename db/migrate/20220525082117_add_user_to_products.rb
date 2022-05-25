class AddUserToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :user_id, :integer
    # add_reference :products, references: :users
  end
end
