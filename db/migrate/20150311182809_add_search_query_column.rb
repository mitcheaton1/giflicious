class AddSearchQueryColumn < ActiveRecord::Migration
  def change
   
   add_column :users, :gif_search_query, :string

  end
end
