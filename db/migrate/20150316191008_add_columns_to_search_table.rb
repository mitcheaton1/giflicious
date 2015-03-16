class AddColumnsToSearchTable < ActiveRecord::Migration
  def change
  	add_column :searches, :gif_search_query, :string
  end
end
