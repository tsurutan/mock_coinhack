class CoinHistory
  attr_accessor :time, :close, :high, :low, :open
  def initialize(time, close, high, low, open)
    self.time = time
    self.close = close
    self.high = high
    self.low = low
    self.open = open
  end
end