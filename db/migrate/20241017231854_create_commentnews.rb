class CreateCommentnews < ActiveRecord::Migration[7.2]
  def change
    create_table :commentnews do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
