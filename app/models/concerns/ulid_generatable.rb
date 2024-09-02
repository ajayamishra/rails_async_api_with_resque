# frozen_string_literal: true

module UlidGeneratable
  extend ActiveSupport::Concern

  included { attribute primary_key, :binary, default: -> { ULID.generate } }
end