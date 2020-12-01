module Webhooks
  module Github
    module Authenticator

      extend ActiveSupport::Concern

      included do
        before_action :verify_signature!, only: :create
      end

      def verified_signature?
        ::Webhooks::Github::AuthService.new(
          request.body.read,
          request.env['HTTP_X_HUB_SIGNATURE_256']
        ).verified_signature?
      end

      def verify_signature!
        head :unauthorized unless verified_signature?
      end
    end
  end
end