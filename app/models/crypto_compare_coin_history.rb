class CryptoCompareCoinHistory


  # enum status: {minute: 'histominute', hour: 'histohour', day: 'histoday'}

  attr_accessor :coin_history, :url

  FORMAT = {
      'minute' => '%H:%M',
      'hour' => '%d-%H',
      'day' => '%m/%d',
  }

  def self.getCoinHistories(time_type)

    crypto_compare_time_type_url = ''
    case time_type
      when 'minute' then
        crypto_compare_time_type_url = 'histominute'
      when 'hour' then
        crypto_compare_time_type_url = 'histohour'
      when 'day' then
        crypto_compare_time_type_url = 'histoday'
    end
    url = 'https://min-api.cryptocompare.com/data/' + crypto_compare_time_type_url + '?fsym=BTC&tsym=USD&limit=100&aggregate=3&e=CCCAGG'
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

  def self.getTimeAndClose(time_type)
    times = []
    prices = []
    getCoinHistories(time_type).each do |coinHistory|
      p coinHistory
      times.push(Time.at(coinHistory.time).strftime(FORMAT[time_type]))
      prices.push(coinHistory.close)
    end
    return times, prices
  end
end