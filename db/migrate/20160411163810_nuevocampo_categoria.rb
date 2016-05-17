class NuevocampoCategoria < ActiveRecord::Migration
  def change

    add_reference :categorias, :grupo, index:true, foreign_key:true
    add_reference :articulos, :categoria, index:true, foreign_key:true

  end
end
