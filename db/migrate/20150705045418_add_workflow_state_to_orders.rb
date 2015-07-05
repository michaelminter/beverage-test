class AddWorkflowStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :workflow_state, :string, after: :quantity
  end
end
