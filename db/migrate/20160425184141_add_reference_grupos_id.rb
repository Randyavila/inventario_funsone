class AddReferenceGruposId < ActiveRecord::Migration
  def change
    add_reference :pedidos, :grupos, index: true

  end
end
