class AddEmploymentStatusToEmployees < ActiveRecord::Migration
  def change
    add_column(:employees, :status, :boolean)
  end
end
