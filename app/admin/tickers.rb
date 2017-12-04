ActiveAdmin.register Ticker do
  permit_params :exchange_id, :url, :volume, :bid, :ask, :market
end
