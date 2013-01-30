class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content

      t.boolean :published, :default => false

      t.timestamps
    end
    add_index :blogs, :created_at
  end
end
