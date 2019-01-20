module Internal
  module ClassMethods
    def authenticate channel, socket
      payload = {'channel' => channel, 'socket' => socket}.to_json
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), Dcxpusher.configuration.secret, payload)
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end