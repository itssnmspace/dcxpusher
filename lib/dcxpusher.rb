require "dcxpusher/version"

module Dcxpusher
  class Error < StandardError; end
  
  # Method accespts channel name, event and data
  # POST a request to socket to send given parameters
  def self.trigger channel, event, data
    payload = {
      "channel"=>channel,
      "event"=>event,
      "data"=>data
    }

    response = HTTP.timeout(connect: 2, write: 2, read: 20).headers(:content_type => "application/json").post("http://35.229.80.85:3000", {json: payload})
    body = JSON.parse(response.body)
  end

  # Method accespts channel name and socket id
  def self.authenticate channel, socket

  end
end