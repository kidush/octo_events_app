class Issues::EventsController < ApplicationController
  include Webhooks::Github::Authenticator

  def index
    render json: Event.all, status: 200
  end

  def create
    create_event = Issues::Events::CreateCommand.new(request.body.read)

    create_event.on(:successful) { render json: 'Event created with success!', status: :created }

    create_event.call
  end
end
