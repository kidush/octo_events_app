require 'rails_helper'

RSpec.describe 'Issues::Events', type: :request do
  describe 'creating a new event from github' do
    context 'when a new issue is created' do
      it 'returns a status of 201' do
        create_event_request

        expect(response).to have_http_status(:created)
      end

      it 'Add one more event on database' do
        expect{ create_event_request }.to change{ Event.all.size }.by(1)
      end
    end
  end

  describe 'Listing issues by issue number' do
    context 'When a valid issue number is passed on url' do
      it 'returns a status of 200' do
        FactoryBot.create(:event)
        get '/issues/1/events'

        expect(response).to have_http_status(:ok)
      end

      it 'does not return a empty response' do
        FactoryBot.create(:event)
        get '/issues/1/events'

        expect(JSON.parse(response.body)).to_not be_empty
      end
    end

    context 'when a invalid issue_number is passed on url' do
      it 'returns a status of 200' do 
        FactoryBot.create(:event)
        get '/issues/2/events'

        expect(response).to have_http_status(:ok)
      end

      it 'returns a empty response' do
        FactoryBot.create(:event)
        get '/issues/2/events'

        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end

  def create_event_request
    post '/issues/events', params: valid_request_body, headers: headers
  end

  def valid_request_body
    File.read("#{Rails.root}/spec/support/webhooks/github/body.json")
  end

  def headers
    {
      "x-hub-signature-256": "sha256=d68d52696dbc077ee3b51ac71b7e08125074ec07335578748e1daa3a003081f8",
      "Content-Type": 'application/json'
    }
  end
end
