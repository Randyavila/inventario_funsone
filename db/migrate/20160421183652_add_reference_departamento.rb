class AddReferenceDepartamento < ActiveRecord::Migration
  def change

    add_reference :articulos, :departamento, index: true

  end
end
