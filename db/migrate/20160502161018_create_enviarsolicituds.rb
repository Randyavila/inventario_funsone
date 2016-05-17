class CreateEnviarsolicituds < ActiveRecord::Migration
  def change
    create_table :enviarsolicituds do |t|

      t.timestamps null: false
    end
  end
end
