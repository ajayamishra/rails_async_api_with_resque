# frozen_string_literal: true

module Interactor
  module Organizer
    module Transactional
      extend ActiveSupport::Concern
      included do
        around do |organizer|
          ApplicationRecord.transaction do
            organizer.call

            # ActiveRecord::Rollback is rescued by the innermost ActiveRecord::Base.transaction
            # If transaction is nested, it won't be rolled back in terms of DB and
            # processing will resume from the next inner transaction.
            # From the above specifications, Organizer should not be nested and used
            raise ActiveRecord::Rollback if context.failure?
          end
        end
      end
    end
  end
end
