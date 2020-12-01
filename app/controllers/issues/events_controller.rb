class Issues::EventsController < ApplicationController
  include Webhooks::Github::Authenticator

  def index
    render json: Event.by_issue_number(params[:issue_number]),
           each_serializer: ::Issues::Events::IndexSerializer, status: :ok
  end

  def create
    create_event = Issues::Events::CreateCommand.new(request.body.read)

    create_event.on(:successful) { render json: 'Event created with success!', status: :created }

    create_event.call
  end
end
