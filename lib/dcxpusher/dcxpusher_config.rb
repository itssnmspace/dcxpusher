class DcxpusherConfig
  def initialize
    @key, @secret = Dcxpusher.configuration.key, Dcxpusher.configuration.secret
  end

  def signature payload
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @secret, payload.to_json)
  end
end