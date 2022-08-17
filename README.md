# どれみる？
　趣味共有コミュニティ

## サイト概要
### サイトテーマ
　何をよむ？何をみる？どれにする？
　小説。漫画など普段の日常でふと悩む次何を見ようかという悩みを共有し解決するコミュニティサイト。
　自分がみておすすめしたいものを紹介したり他の人から面白いと評価が高いものを簡単に見つけることができるサイト。

### テーマを選んだ理由
　私は小説や漫画などが好きで次何を見ようかと検索することが多いです。
　しかし、検索では個人のランキングサイトか出版社が出したものが多いためもっと身近に多くの人が個人的なおすすめを語り合えるサイトがあったらいいなと考えました。

### ターゲットユーザ
　小説・漫画などの趣味人

### 主な利用シーン
　自分が次見たいと思える作品をすぐ見つけることができる。自分が好きな作品を共有できる。

## 設計書
<...>

使用gem
devise	            会員と管理者登録<br>
devise-i18n.        deviseの日本語化<br>
kaminari	          ページネーション<br>
bootstrap	          デザイン<br>
enum_help	          ステータス管理<br>
rails-i18n	         日本語化<br>
jquery-rails	       レビューおよびAPIに使用<br>
rakuten_web_service　楽天APIにより本の画像使用<br>
dotenv-rails          環境変数の使用<br>
byebug　　　　　　　開発時に使用<br>
rubocop.            リーダブルコードの確認<br>
image_processing.   s3バケットの連携<br>
aws-sdk-s3          s3バケットの連携<br>

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- 楽天APIによる書籍画像。
- 『いらすとや』(https://www.irasutoya.com/)の素材使用

![PF_ER図-PF drawio (1)](https://user-images.githubusercontent.com/104709136/184349682-c65c8004-e5cd-40ac-9a4a-6586cbdae14a.png)
![PF _UIフロー-管理者側 drawio](https://user-images.githubusercontent.com/104709136/181411508-dc570331-485f-484c-9662-b5e250420324.png)
![PF _UIフロー-会員側 drawio](https://user-images.githubusercontent.com/104709136/181411522-34d96cb4-4a0d-4d0f-a5c1-36376bd9975c.png)
