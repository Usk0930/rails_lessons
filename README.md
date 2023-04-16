# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
-------------------------------------------------------------------
以下、メモ

## routesについて
-  routerにresourcesを宣言するだけで、コントローラのindex、show、new、edit、create、update、destroyアクションを個別に宣言しなくても1行で宣言が完了します。

## コマンドについて
- rails g controller 〇〇
- rails g scaffold 〇〇
⇨　結構使わない（かも）ファイルもできる印象、どっち使うことが多い？
- bundle lock
⇨gemfileを更新せずgemfile.lockのみを更新

## migration
- changeメソッドは、ロールバック時その処理と逆の処理をRailsが自動で判定して行う
- changeメソッドに対応していないマイグレーション定義（change_columnなど）を指定した場合はエラーが発生
- ↑の場合はchangeじゃなくてreversibleを使う

## controller
- Laravelの様に、DBから取得⇨viewに渡すみたいな処理を書かなくてもMVCの命名とメソッド名からよしなにやってくれるみたい（showメソッドの中身が空でも表示された）

## rbenvとrvm
- 両方rubyのバージョン管理ツール
- rvmのほうが機能が盛りだくさん
- 現場ではどっち使う方が多い？(rails-tutorialではrvmだった）

## gemとは
- ruby用のライブラリを指す
- 例えば広義にはrailsのgemの一種

## bundlerとは
- phpでいうcomposerのようなもの
- bundle installでgemfileの記述をもとにライブラリをインストールする

## gemfileとは
- composer.jsonみたいなもの

## migrationがDBの設定してないのに動くのはなぜ？

## コマンド短縮系
- 完全なコマンド	短縮形
$ rails server	$ rails s
$ rails console	$ rails c
$ rails generate	$ rails g
$ rails test	$ rails t
$ bundle install	$ bundle

## gコマンド実行後にもとに戻す方法
Railsはコントローラ以外にも関連ファイルを大量に生成するので、生成されたコントローラファイルを削除するだけでは元に戻りません。自動生成されたコードを元に戻すためには、新規作成されたファイルを削除するだけではなく、既存のファイルに挿入されたコードも削除する必要があります。
このようなときは、「generate」（生成）と逆の意味を持つ、rails destroyというコマンドを実行することで元に戻せます。

## contollerをｇコマンドで作成する際にメソッド名を指定すると対応するroute,viewファイルを作成してくれる
- 例：rails g TestContoroller test
- viewが必要ないcreateやdestroyはメソッド名を指定せずあとからコントローラに追記する
- TODO:後からメソッド追加する時のコマンドは？
⇨

## ルーティング
- root "file#method"でルートを指定
- get "file/method"で/methodのルーティングを設定

## Guard
テストの自動化が行えるgem?

## git switch
- git checkoutの代わりに使う
- checkoutの機能をswitchと〇〇に分離したもの
- git checkout -b ⇨ git switch -c

## rails console
- ターミナルから任意のコードを実行できる

## 文字列””内での変数展開
- "#{test1} #{test2}"の様な形で変数test1とtest2を展開できる
- シングルクォート内では変数展開しない（phpと同様）

## オブジェクトの考え方
- rubyは全てのものがオブジェクト
- 例えば文字列オブジェクトはlengthメソッドを持つ("moji".length みたいな感じ)

## ハッシュ、シンボル
- ハッシュ⇨連想配列
- シンボル⇨連想配列のキー

## @変数名　について
- インスタンス変数（インスタンス時、またはインスタンスメソッドからアクセスできる）
- クラス内のどこからでも参照できる(プロパティ)
- PHPみたいに事前に定義しておく必要はない（事前に定義が必要なのはクラスインスタンス変数＠やクラス変数@@全てのインスタンスで共有される値)

## インスタンスメソッド、クラスメソッドの違い
- クラスメソッド：クラス内で使えるメソッド、self(または自身のクラス名).methodと書く
- インスタンスメソッド：インスタンス化して使うメソッド、普通に書く
- 個別のインスタンスに関する情報以外はクラスメソッドでOK

## メソッドの後ろの？について
- Rubyでは、メソッドがtrueまたはfalseという論理値（boolean）を返すことを、末尾の疑問符で示す慣習があります。
- 例："moji".empty? や　s.include?("foo")

## メソッドの後ろの！について
- 破壊的メソッドであるという印、元の変数をメソッドによって変更する

## メソッドの引数にデフォルト値を持たせており、デフォルト値を使いたい場合は呼び出す時に（）が不要
- 例：def method(test = nil) ⇨呼び出し時⇨method

## 暗黙のreturn
- 最後に評価した値を暗黙的にreturn してくれる

## 配列の最後のインデックス
- arr.lastかarr[-1]で指定できる
- 範囲指定でも便利⇨arr[0..-1]で最初から最後までを指定できる

## ブロック
- ブロックとは：引数の塊(doからendまで、または{}で囲われた範囲が引数)
- 配列、または範囲に対して繰り返し処理f
- 繰り返し内の処理が長い場合do-endで囲う
(1..4).each do |i|
    puts i * 2
end
- 短い場合は{}で囲って一行で書く
(1..4).each { |i| puts i * 2}
- ブロック内で使用する変数は|i|と書く（iの部分はなんでもOK)

## inspect
- オブジェクトを表示するためにinspectを使うことは非常に多いので、 pメソッドというショートカットがあります

## rubyではメソッド呼び出し時に()を省略できる

## データの保存
- モデルに各データをあてはめsaveかcreateメソッドに引数で渡す
- 引数にはハッシュで渡す
- createの戻り値は論理値ではなく作成されたオブジェクト
- 更新もupdateで同じ感じ

## データの検索
- find, allの他にfind_by（引数に指定したカラムでwhereしてfind)もできる
- findではデータが存在しない場合エラーとなるが、find_byではnilが返る

## オプションハッシュについて

## パスワード
- has_secure_passwordをモデルにかく

## パーシャルとは
- viewで使う部品

## TLSとは
- TLSは、ローカルのサーバーからネットワークにデータを送信する前に大事な情報を暗号化する技術です。
- railsでの扱いは「7.5.1本番環境でのTLS」を参照

## fixtureとは
- テスト時にDBへ初期データを投入してくれる

## コントローラでパラメータを受け取る時
- ストロングパラメータを使う
- params.require(:user).permit(:name, :email, :password, :password_confirmation)みたいな書き方になる

## Turboとは
- railsとは直接関係ない？
- TODO:よく使われるものであれば学習

## raise
- 検証用に例外を発生させる処理

## controllerの作成基準について
- rails tutorialではusersコントローラーと別に、sessionsコントローラーやAccountActivationsコントローラーを作成した
- TODO:どんな基準でコントローラーを作成するか確認する
- 一説では、resourcesが重複する場合に分けるといった記事があった

## ビジネスロジックはどこに書く？
- TODO: