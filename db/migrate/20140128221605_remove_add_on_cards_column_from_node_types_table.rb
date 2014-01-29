class RemoveAddOnCardsColumnFromNodeTypesTable < ActiveRecord::Migration
  def change
    remove_column :node_types, :add_on_cards
  end
end
