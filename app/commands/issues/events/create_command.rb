module Issues
  module Events
    class CreateCommand
      include Wisper::Publisher

      def initialize(payload)
        @payload = JSON.parse(payload)
      end

      def call
        save_event
      end

      private

      attr_reader :payload

      def save_event
        Event.create!(issue_id: payload['issue']['number'], body: payload)

        broadcast(:successful)
      end
    end
  end
end