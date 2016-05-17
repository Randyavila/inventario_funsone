class AddReferenceArticulosId < ActiveRecord::Migration
  def change

    add_reference :pedidos, :articulos, index: true


  end
end
