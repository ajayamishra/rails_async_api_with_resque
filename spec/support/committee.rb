# frozen_string_literal: true

require 'committee'
require 'committee/rails'

module CommiteePrivateApiSchema
  include Committee::Rails::Test::Methods

  def committee_options
    @committee_options ||= {
      schema_path: Rails.root.join('schemas/api/private/openapi.yaml').to_s,
      query_hash_key: 'rack.request.query_hash',
      old_assert_behavior: false,
      parse_response_by_content_type: false,
      strict_reference_validation: true,
    }
  end
end

shared_examples 'fulfill valid schema by committee' do
  it 'accept and return expected schema' do
    expect(subject).to have_http_status(:success)
    assert_request_schema_confirm
    assert_response_schema_confirm(200)
  end
end

RSpec.configure do |config|
  config.add_setting :committee_options, type: :request
  config.include CommiteePrivateApiSchema, type: :request
end
