# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Interactor::Organizer::Transactional do
  subject(:call) { organizer_class.call(will_fail: will_fail) }

  let(:organizer_class) do
    Class.new do
      include Interactor::Organizer
      include Interactor::Organizer::Transactional

      test_interactor =
        Class.new do
          include Interactor

          def call
            # rubocop:disable FactoryBot/SyntaxMethods
            FactoryBot.create(:user)
            # rubocop:enable FactoryBot/SyntaxMethods
            context.fail! if context.will_fail # Allow the caller to control the failure
          end
        end

      organize test_interactor
    end
  end

  context 'when succeed' do
    let(:will_fail) { false }

    it 'Record increases because it is committed' do
      expect { call }.to change { User.count }.by(1)
    end
  end

  context 'when failure' do
    let(:will_fail) { true }

    it 'Record does not increase because it is rolled back' do
      expect { call }.not_to(change { User.count })
    end
  end
end
