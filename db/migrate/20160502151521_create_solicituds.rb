class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.integer :nunsolicitud

      t.timestamps null: false
    end
  end
end
