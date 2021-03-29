class RenameOrderdetail < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_detalls, :order_details
  end
end
