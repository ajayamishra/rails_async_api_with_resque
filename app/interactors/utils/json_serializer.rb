# frozen_string_literal: true
module Utils
  class JsonSerializer
    include Interactor
    delegate :query,
             :entity,
             :total_count,
             :serializer,
             :limit,
             :offset,
             :message,
             :custom_meta,
             :serializer_params,
             to: :context,
             private: true

    def call
      # TODO: Provide a better error message
      raise StandardError, 'serializer is nil' if serializer.nil?

      context.serialized = serializer.new(query || entity, params: serializer_params || {}).serialize(meta: meta)
    end

    private

    def meta
      {
        limit: query.try(:limit_value) || limit,
        offset: query.try(:offset_value) || offset,
        message: message,
        total_count: total_count,
      }.compact.merge(custom_meta || {})
    end
  end
end
