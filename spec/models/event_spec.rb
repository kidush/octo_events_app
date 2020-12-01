require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.by_issue_number' do
    context 'when a valid issue number is passed' do
      it 'returns all the events related to the issue' do
        create_list(:event, 3)

        expect(described_class.by_issue_number(1).last.issue_number).to eq 1
      end
    end
  end
end
