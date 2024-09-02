# frozen_string_literal: true

require 'rails_helper'

describe Utils::JsonSerializer do
  let(:query) { double('Query', limit_value: 10, offset_value: 5) }
  let(:entity) { double('Entity') }
  let(:total_count) { 100 }
  let(:serializer) { double('Serializer', new: serializer_instance) }
  let(:serializer_instance) { double('SerializerInstance', serialize: 'serialized_data') }
  let(:limit) { 10 }
  let(:offset) { 5 }
  let(:message) { 'Test message' }
  let(:custom_meta) { { custom_key: 'custom_value' } }
  let(:serializer_params) { { param1: 'value1' } }
  let(:context) do
    Interactor::Context.new(
      query: query,
      entity: entity,
      total_count: total_count,
      serializer: serializer,
      limit: limit,
      offset: offset,
      message: message,
      custom_meta: custom_meta,
      serializer_params: serializer_params
    )
  end

  subject { described_class.call(context) }

  describe '#call' do
    context 'when serializer is nil' do
      let(:serializer) { nil }

      it 'raises an StandardError' do
        expect { subject }.to raise_error(StandardError, 'serializer is nil')
      end
    end

    context 'when serializer is present' do
      it 'serializes the data correctly' do
        subject
        expect(context.serialized).to eq('serialized_data')
      end
    end
  end

  describe '#meta' do
    it 'returns the correct metadata' do
      serializer_instance = described_class.new(context)
      expected_meta = {
        limit: 10,
        offset: 5,
        message: 'Test message',
        total_count: 100,
        custom_key: 'custom_value'
      }
      expect(serializer_instance.send(:meta)).to eq(expected_meta)
    end
  end
end