require 'rails_helper'

describe Api::V1::StatusController, type: :controller do
  before { post :create, params: payload }
  subject { JSON.parse(response.body) }

  context 'with a valid status' do
    let(:payload) {{ status: {stat: 'up' } }}

    it 'returns a 200 status' do
      expect(subject['success']).to be(true)
      expect(response.status).to be(200)
    end
  end

  context 'with an invalid status' do
    let(:payload) {{ status: {stat: 'bad status' } }}

    it 'returns a 400 status' do
      expect(subject['success']).to be(false)
      expect(response.status).to be(400)
    end
  end

  context 'with an empty payload' do
    let(:payload) {{ status: {} }}

    it 'returns a 422 status' do
      expect(subject['success']).to be(false)
      expect(response.status).to be(422)
    end
  end
end
