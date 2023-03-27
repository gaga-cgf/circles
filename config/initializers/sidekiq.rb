redis_config = YAML.load_file(Rails.root.to_s + '/config/redis.yml')[Rails.env.to_s]

Sidekiq.configure_client do |config|
  config.redis = { url: redis_config['url'] }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_config['url'] }
end
