# frozen_string_literal: true

def redis_logger
  if ENV['RAILS_lOG_TO_STDOUT'].present? || Rails.env.development?
    Logger.new(STDOUT)
  else
    Logger.new(Rails.root.join('log', '#{Rails.env}_resque.log'))
  end
end

Resque.redis = Settings.server.app.redis.url
Resque.redis.namespace = Settings.server.app.redis.namespace

Resque.logger = redis_logger
Resque.logger.level = Logger::INFO