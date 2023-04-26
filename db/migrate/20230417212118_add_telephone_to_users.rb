class AddTelephoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :telefono, :string
  end
end
