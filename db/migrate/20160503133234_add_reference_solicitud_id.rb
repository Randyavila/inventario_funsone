class AddReferenceSolicitudId < ActiveRecord::Migration
  def change

    add_reference :enviarsolicituds, :solicitud, index: true


  end
end
