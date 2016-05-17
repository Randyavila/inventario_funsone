class RemoveColumn < ActiveRecord::Migration
  def self.up
    remove_column :articulos, :status
    end
end
