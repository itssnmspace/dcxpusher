module Internal
  module ClassMethods
    def authenticate channel, socket
      DcxpusherConfig.new.signature({'channel' => channel, 'socket' => socket})
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end