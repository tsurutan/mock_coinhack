# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Exchange.create(:name => 'Coincheck',
#                 :icon => 'coincheck/png',
#                 :overview => "ビットコインはサトシ・ナカモト(Satoshi Nakamoto) を名乗る人物によって投稿された論文に基づき、2009年に運用が開始された。",
#                 :description => "ビットコインはサトシ・ナカモト(Satoshi Nakamoto) を名乗る人物によって投稿された論文に基づき、2009年に運用が開始された。
# ビットコインシステムはピア・トゥー・ピア型のネットワークにより運営され、トランザクションは仲介者なしでユーザ間で直接に行われる。このトランザクションはネットワークに参加しているノードによって検証され、ブロックチェーンと呼ばれる公開分散元帳に記録されていく。
# トランザクションでは通貨単位としてビットコイン (BTC) が使用される。このシステムは中央格納サーバや単一の管理者を置かずに運営されるので、米国財務省はビットコインを分散化された仮想通貨というカテゴリーに分類している。ビットコインは最初の暗号通貨とも言われるが、DigiCashやRippleといった先行システムが存在し、それを最初の分散化されたデジタル通貨として説明するのがより正確である。ビットコインは、この種のシステムの中では最大の時価総額を持つものである。",
#                 :exchange_type => "販売所・取引所",
#                 :credit_transaction => "レバ最大15倍",
#                 :futures_transaction => "レバ最大15倍")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')