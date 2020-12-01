require 'rails_helper'  

RSpec.describe Webhooks::Github::AuthService, type: :service do
  describe '#verified_signature?' do
    context 'When a valid signature is provided' do
      it 'returns true' do
        request_body = File.read("#{Rails.root}/spec/support/webhooks/github/body.json")
        request_signature = 'sha256=d68d52696dbc077ee3b51ac71b7e08125074ec07335578748e1daa3a003081f8'

        auth = described_class.new(request_body, request_signature)
        expect(auth.verified_signature?).to be_truthy
      end
    end

    context 'When a invalid signature is provided' do
      it 'returns false' do
        request_body = '{body: "A invalid body, just for testing purposes."}'
        request_signature = 'sha256=d68d52696dbc077ee3b51ac71b7e08125074ec07335578748e1daa3a003081f8'

        auth = described_class.new(request_body, request_signature)
        expect(auth.verified_signature?).to be_falsy
      end
    end
  end
end