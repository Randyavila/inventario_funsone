class AddReferenceArticuloAndOthers < ActiveRecord::Migration
  def change

    add_reference :solicituds, :articulo, index: true
    add_reference :enviarsolicituds, :articulo, index: true

  end
end
