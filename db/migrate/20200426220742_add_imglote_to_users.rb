class AddImgloteToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :imglote, :string
  end
end
