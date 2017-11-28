module V1
  class TickerEntity < Grape::Entity
    expose :id, documentation: {type: Integer, desc: "ユーザーid"}
    expose :email, documentation: {type: String, desc: "メールアドレス"}
    expose :name, documentation: {type: String, desc: "名前"}
    expose :created_at, documentation: {type: String, desc: "作成日時"}
    expose :updated_at, documentation: {type: String, desc: "更新日時"}
  end

  class Exchanges < Grape::API
    # helpers RequestHelper
    resource 'ticker', desc: 'Ticker', swagger: {nested: false} do
      desc 'Tickerの取得', {
          entity: TickerEntity,
          response: {isArray: true, entity: TickerEntity}
      }
      get do
        Ticker.callApi(Exchange.find(params['id']))
      end
    end
  end
end