# frozen_string_literal: true

require 'rails_helper'

shared_examples 'UlidGeneratable' do
  describe 'primary_key' do
    context 'when primary_key column is id' do
      subject { described_class.new.id }

      it { is_expected.to match(/[0-9A-Z]{26}/) }
    end
  end
end