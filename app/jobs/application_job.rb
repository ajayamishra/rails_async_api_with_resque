class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  def attempts_key
    @attempts_key = "#{self.class.name}:#{@job_id}:attempts"
  end

  def track_attempt
    Resque.redis.incr(attempts_key)
    Resque.redis.expire(attempts_key, 30.minutes)
  end

  def attempts_remaining
    attempts_made = Resque.redis.get(attempts_key).to_i
    total_attempts_allowed = selft.class.RETRY_ATTEMPTS - 1
    total_attempts_allowed - attempts_made
  end
end
