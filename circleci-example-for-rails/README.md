# circleci-example-for-rails
## 概要
このリポジトリは、

「[【初心者向け】CircleCIでRailsのテストを自動化してみよう！](https://note.mu/ho_m_ie/n/n41700b7ffe16)」

という教材の内容に沿ってCircleCIを動かすためのサンプルアプリケーションです。

## 教材リンク
https://note.mu/ho_m_ie/n/n41700b7ffe16

## アプリケーション構成
本リポジトリのアプリケーション構成は次の通りです。

```bash
Rails version        5.2.3
Ruby version         2.6.1-p33 (x86_64-darwin18)
RubyGems version     3.0.3
Rack version         2.0.7
Database adapter     mysql2
Testing framework RSpec
```

## ローカルでのテスト実行手順
下記手順に沿ってコマンドを実行することで、ローカルでRSpecによるテストを動かすことができます。

ただし、 事前にconfig/database.ymlをご自身の環境に応じて編集してください。
```bash
$ bundle install --path vendor/bundle
$ bundle exec rails db:create db:migrate
$ bundle exec rspec
```
