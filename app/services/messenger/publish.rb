module Messenger
  class Publish
    attr_reader :channel, :event, :message

    def initialize(event, message)
      @channel = ENV['PUSHER_CHANNEL'] || 'test_channel'
      @event = event
      @message = message
    end

    def call
      Pusher[channel].trigger(event, { message: message })
    end
  end
end
