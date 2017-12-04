module V1
  class TickerEntity < Grape::Entity
    expose :id, documentation: {type: Integer, desc: "ユーザーid"}
    expose :email, documentation: {type: String, desc: "メールアドレス"}
    expose :name, documentation: {type: String, desc: "名前"}
    expose :created_at, documentation: {type: String, desc: "作成日時"}
    expose :updated_at, documentation: {type: String, desc: "更新日時"}
  end

  class Exchanges < Grape::API

    resource 'ticker', desc: 'Ticker', swagger: {nested: false} do
      desc 'Tickerの取得', {
          entity: TickerEntity,
          response: {isArray: true, entity: TickerEntity}
      }
      get do
        TickerApi.callApi(Exchange.find(params['id']))
      end
    end
    resource 'coin_history', desc: 'Ticker', swagger: {nested: false} do
      get do
        crypto_compare_coin_history = CryptoCompareCoinHistory.new(params['symbol'], params['time_type'])
        crypto_compare_coin_history.getTimeAndClose
      end
    end
  end
end