require 'rails_helper'

describe Status, type: :model do
  it { should validate_inclusion_of(:stat).in_array(%w(up down)) }
  it { should validate_presence_of(:stat) }
  it { should validate_presence_of(:message) }

  describe '#current_status' do
    before { create_list(:status, 3) }
    let!(:status) { create(:status, stat: 'down', message: 'i am down') }

    it 'returns the right status' do
      expect(Status.current_status).to eq('down')
    end
  end

  describe '#latest' do
    before { create_list(:status, 12) }

    it 'returns the last 10 status messages' do
      expect(Status.latest.count).to eq(10)
    end
  end
end
