# frozen_string_literal: true

class BlogsTag < ApplicationRecord
  self.table_name = 'blogs_tags'

  validates :blog_id, uniqueness: { scope: [:tag_id] }

  belongs_to :blog
  belongs_to :tag
end
