class AddWorkflowStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :workflow_state, :string, after: :quantity, default: 'ordered'
  end
end
