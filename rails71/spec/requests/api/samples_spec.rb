# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Samples', type: :request do
  describe 'GET /api/samples' do
    it 'works! (now write some real specs)' do
      headers = { 'CONTENT_TYPE' => 'application/json' }

      # paramsはhashじゃなくてJSON形式の文字列にする
      post(api_sample_path, params: { page: 1 }.to_json, headers:)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response.body).to include({ page: '1', type: 'String' }.to_json)
    end
  end
end
