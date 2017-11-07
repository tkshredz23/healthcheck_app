require 'rails_helper'

describe Status, type: :model do
  it { should validate_inclusion_of(:stat).in_array(%w(up down)) }
  it { should validate_presence_of(:stat) }
  it { should validate_presence_of(:message) }
end
