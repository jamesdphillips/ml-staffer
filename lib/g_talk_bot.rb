module GTalk
  class Bot

    def initialize
      @im = Jabber::Simple.new('metalabstatusbot@gmail.com', 'gA7;q$L8,:U')
      @im.accept_subscriptions = true
    end

    def friend_updates
      @im.presence_updates
    end

  end
end
