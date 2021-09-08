class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :theme, null: false
      t.text :detail, null: false
      t.date :date, null: false
      t.datetime :start_at, null: false
      t.datetime :finish_at, null: false
      t.references :user, null:false, foreign_key: true 
      t.timestamps
    end
  end
end


