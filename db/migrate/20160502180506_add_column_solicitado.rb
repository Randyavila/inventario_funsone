class AddColumnSolicitado < ActiveRecord::Migration
  def change

    add_column :enviarsolicituds, :solicitado, :integer


  end
end
