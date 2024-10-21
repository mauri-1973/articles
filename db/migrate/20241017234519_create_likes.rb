class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.integer :user_id,  null: true, default: 0
      t.references :post, null: false, foreign_key: true
      t.string :type_react,  null: false
      t.timestamps
    end
  end
end
