# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user, inverse_of: :blogs
  has_many :blogs_tags, class_name: 'BlogsTag', dependent: :destroy
  has_many :tags, through: :blogs_tags

  validates :title, presence: { message: '标题不能为空' }
  validates :content, presence: { message: '内容不能为空' }
  validates :user_id, presence: { message: '用户不能为空' }

  delegate :username, to: :user
end
