class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :explanation, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.references :user, null:false,foreign_key: true
      t.timestamps
    end
  end
end
