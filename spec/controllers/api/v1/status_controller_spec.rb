require 'rails_helper'

describe Api::V1::StatusController, type: :controller do

  context 'with authenticated user' do
    before do
      request.headers.merge!(authenticated_header)
      post :create, params: payload
    end

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

  context 'with unauthenticated user' do
    before do
      post :create, params: payload
    end

    subject { JSON.parse(response.body) }

    context 'with a valid status' do
      let(:payload) {{ status: {stat: 'up' } }}

      it 'returns a 401 status' do
        expect(response.status).to be(401)
      end
    end
  end

  def authenticated_header
    user = create(:user, email: 'test@email.com', password: 'password')
    resp = AuthenticateUser.call(user.email, 'password')
    {'Authorization': resp.result }
  end
end
