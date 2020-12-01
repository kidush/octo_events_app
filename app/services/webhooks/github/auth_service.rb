module Webhooks
  module Github
    class AuthService
      SECRET_TOKEN = ENV['SECRET_TOKEN']

      attr_reader :request_body, :request_signature

      def initialize(request_body, request_signature)
        @request_body = request_body
        @request_signature = request_signature
      end

      def verified_signature?
        verify_signature
      end

      private

      def verify_signature
        signature = "sha256=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), SECRET_TOKEN, request_body)}"
        return false unless Rack::Utils.secure_compare(signature, request_signature)

        true
      end
    end
  end
end