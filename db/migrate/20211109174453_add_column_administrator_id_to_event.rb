class AddColumnAdministratorIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column(:events, :administrator_id, :bigint)
  end
end
