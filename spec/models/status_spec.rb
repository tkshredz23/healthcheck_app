require 'rails_helper'

describe Status, type: :model do
  it { should validate_inclusion_of(:stat).in_array(%w(up down)) }
  it { should validate_presence_of(:stat) }
  it { should validate_presence_of(:message) }

  describe '#current_status' do
    before { create_list(:status, 3) }
    let!(:status) { create(:status, stat: 'down', message: 'i am down') }

    it 'returns the latest status' do
      expect(Status.current_status).to eq('down')
    end
  end

  describe '#latest' do
    before { create_list(:status, 12) }

    it 'returns the last 10 status messages' do
      expect(Status.latest.count).to eq(10)
    end
  end

  context 'when updating only the message' do
    before { create_list(:status, 3) }
    let(:status) { create(:status, message: 'a message') }

    it 'does not change the current status' do
      expect{ status }.to_not change{ Status.current_status }
    end

    it 'returns the latest message' do
      expect{ status }.to change{ Status.latest.count }.by(1)
    end
  end

  context 'when updating only the status' do
    before { create_list(:status, 3) }
    let(:status) { create(:status, stat: 'down', message: nil) }

    it 'changes the current status' do
      expect{ status }.to change{ Status.current_status }.from('up').to('down')
    end

    it 'returns the latest message' do
      expect{ status }.to_not change{ Status.latest.count }
    end
  end
end
