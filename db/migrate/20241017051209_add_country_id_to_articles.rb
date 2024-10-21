class AddCountryIdToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :country_id, :integer
    add_foreign_key :articles, :countries
    add_index :articles, :country_id
  end
end