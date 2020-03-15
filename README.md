# JAPONICAL

全国の知られていないお土産を投稿し、googlemap上で何県のお土産なのかが
わかるサービスです。

https://i.gyazo.com/5989c8a4717e09446f47001702409354.gif


# URL
http://3.115.70.84/

非ログイン時は投稿データのみを見る事ができます。
簡単ログインのボタンを押す事でメールアドレスやユーザーネームを登録せずに投稿する事が可能です。

# 言語・使用技術

## フロント
* Haml
* Scss
* jQuery

## バックエンド
* Ruby 2.5.1
* Ruby on Rails 5.2.4

## サーバー
* Nginx 1.15.8

## DB
* MySQL 5.7

## インフラ・開発環境等
* Docker/docker-compose
* AWS（EC2, S3）
* RSpec

## 機能一覧
* ユーザー機能(devise使用）
* ユーザー新規登録
* ユーザーログイン・ログアウト機能
* 記事投稿、編集、削除機能
* 画像投稿機能(carrierwave)
* タグ機能(現段階では登録のみ、acts-as-taggable-on)
* 検索機能
* ページネーション機能(kaminari)
* 住所&経度・緯度取得機能(geocoder)
* 地図表示機能(Maps JavaScript API)
