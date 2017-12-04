class CryptoCompareCoinHistory
  attr_accessor :coin_history, :symbol, :coin_history_info

  CoinHistoryInfo = Struct.new(:endpoint, :format) do
    def getUrl(symbol)
      return "https://min-api.cryptocompare.com#{endpoint}?fsym=#{symbol}&tsym=JPY&limit=30"
    end
  end

  COIN_HISTORY_INFO_MINUTE = CoinHistoryInfo.new('/data/histominute', '%H:%M')
  COIN_HISTORY_INFO_HOUR= CoinHistoryInfo.new('/data/histohour', '%d-%H')
  COIN_HISTORY_INFO_DAY = CoinHistoryInfo.new('/data/histoday', '%m/%d')


  COIN_HISTORY_INFOS = {
      'minute' => COIN_HISTORY_INFO_MINUTE,
      'hour' => COIN_HISTORY_INFO_HOUR,
      'day' => COIN_HISTORY_INFO_DAY,
  }

  def initialize(symbol, time_type)
    self.symbol = symbol
    self.coin_history_info = COIN_HISTORY_INFOS[time_type]
  end

  def getTimeAndClose
    times = []
    prices = []
    getCoinHistories().each do |coinHistory|
      times.push(Time.at(coinHistory.time).strftime(coin_history_info.format))
      prices.push(coinHistory.close)
    end
    return times, prices
  end

  def getCoinHistories
    url = coin_history_info.getUrl(symbol)
    uri = URI.parse(url)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    coin_histories = []
    result['Data'].each do |data|
      coin_history = CoinHistory.new(data['time'], data['close'], data['high'], data['low'], data['open'])
      coin_histories.push(coin_history)
    end
    return coin_histories
  end
end