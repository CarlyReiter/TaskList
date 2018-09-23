class AddCheckoffStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :checkoff_status, :boolean, :default => false
  end
end
