class RemoveStatusFromEmployees < ActiveRecord::Migration
  def change
    remove_column(:employees, :status, :boolean)
  end
end
