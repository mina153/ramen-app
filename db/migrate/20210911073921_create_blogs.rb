class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :dairy, null: false
      t.text :content, null: false
      t.datetime :start_time

      t.timestamps
    end
  end
end
