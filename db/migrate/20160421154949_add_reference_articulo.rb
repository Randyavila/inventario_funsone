class AddReferenceArticulo < ActiveRecord::Migration
  def change
    add_reference :articulos, :estados, index: true
  end
end
