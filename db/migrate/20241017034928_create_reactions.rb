class CreateReactions < ActiveRecord::Migration[7.2]
  def change
    create_table :reactions do |t|
      t.references :article, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.string :kind

      t.timestamps
    end
  end
end
