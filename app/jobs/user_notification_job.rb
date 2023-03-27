# frozen_string_literal: true

class UserNotificationJob < ApplicationJob
  queue_as :default

  def perform
    puts 'sidekiq_job11233'
  end
end
