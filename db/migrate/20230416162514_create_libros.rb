class CreateLibros < ActiveRecord::Migration[7.0]
  def change
    create_table :libros do |t|
      t.text :titulo
      t.integer :fecha
      t.text :categoria
      t.text :autor
      t.integer :precio
      t.integer :stock
      t.text :descripcion

      t.timestamps
    end
  end
end
