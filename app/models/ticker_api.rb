class TickerApi
  attr_accessor :volume, :name, :friends, :spread

  def initialize(volume, bid, ask, spread)
    @volume = volume
    @bid = bid
    @ask = ask
    @spread = spread
  end

  def self.callApi(exchange)
    uri = URI.parse(exchange.ticker_url)
    data = JSON.parse(Net::HTTP.get(uri))
    volume = data[exchange.volume_key]
    bid = data[exchange.bid_key]
    ask = data[exchange.ask_key]
    spread = ask - bid
    TickerApi.new(volume.ceil, bid, ask, spread)
  end
end