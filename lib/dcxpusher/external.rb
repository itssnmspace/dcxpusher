module External
  module ClassMethods
    def trigger channel, event, data
      payload = {
        "channel"=>channel,
        "event"=>event,
        "data"=>data
      }

      response = HTTP.timeout(connect: 2, write: 2, read: 20).headers(:content_type => "application/json").post("#{Dcxpusher.configuration.base_url}/push", {json: payload})
      puts JSON.parse(response.body)
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end