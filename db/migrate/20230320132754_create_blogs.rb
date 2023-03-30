# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.boolean :is_public, default: true
      t.references :user,foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
