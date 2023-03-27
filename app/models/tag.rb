# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :blogs_tags, class_name: 'BlogsTag', dependent: :destroy
  has_many :blogs, through: :blogs_tags

  validates :title, uniqueness: { message: '标签已存在' }
end
