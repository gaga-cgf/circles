# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.boolean :is_public, default: true
      t.belongs_to :user, class_name: "user", foreign_key: "user_id"
      t.timestamps
    end

    add_index :blogs, [:user_id]
  end
end
