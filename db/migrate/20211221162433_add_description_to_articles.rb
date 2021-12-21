class AddDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    # :[table], :[added_field_name], :[data_type]
    add_column :articles, :description, :text 
  end
end
