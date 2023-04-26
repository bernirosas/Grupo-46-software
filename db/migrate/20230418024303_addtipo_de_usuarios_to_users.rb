class AddtipoDeUsuariosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tipo_de_usuario, :string
  end
end
