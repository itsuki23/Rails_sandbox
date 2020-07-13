# クライマー専門のカーシェアリングサービス  

## 自然の岩を登るにも二種類に分けられる
* ロープを使ったリードクライミング
* 何も使わず比較的低い岩を登るボルダリング  

## 今アツいのはボルダリング！！しかし悲しい現実…
* 落ちたら地面なのでマットを持ってかなきゃいけないが、物凄く嵩張る
* マットも自分も汚れることもあるためレンタカーには気を遣う
* 電車移動は白い目で見られる、ていうか誰もやってない
* サービス業で平日休みだからみんなと休みが合わない
* かなり危ないこともするためスポッター（後ろで落ちた時にフォローする人）が欲しい  
などなど…  

## マッチングやカーシェアリングはあってもクライマーじゃないと…  
&nbsp;&nbsp;&nbsp;&nbsp; ってことで作ってみることに！  


# 設計

## 基本的な機能
* ユーザー認証
* イベント投稿
* コメント
* お気に入り
* エントリー

## MR図  

![rm-2](https://user-images.githubusercontent.com/58794866/77065035-e1a04c80-6a23-11ea-8bf0-b6eb89c5214f.png)

## Rails 実装
#### MR図を元にModelとcontrollerを作成
#### 作成したビュー
* homes/index
* events/index show new edit
* users/show edit
* devise/registrators/new edit
* devise/sessions/new

#### 使用gem
* sass
* haml
* simple_calender
* devise
* bootstrap
* kaminari

#### 今回使用した言語など
* ruby 2.5.1
* ruby on Rails 5.2.4.1
* jQuery
* Mysql 8.0.19  


![アートボード 1-100](https://user-images.githubusercontent.com/58794866/77060648-4061c800-6a1c-11ea-9dd8-65de980d6b6b.jpg)

# 苦労した点

### devise周りの理解に苦しんだ
gemに隠れて見えない部分が多く、最低限使う機能を理解するのにも時間がかかった。現在も自信を持って使えるとはいえない状況。ドキュメントを少しずつ理解していきたい。

### フロントの実装
検索メインで進めたため、体系的に理解できてない部分が多く、当初時間がかかった。実装に関しては目先の問題よりも、体系的に全体像を掴んで、最低限ドキュメントを理解できるぐらいにはしとくべきだと思った。

### モデルを過多に作った
当初、MR図にはRelationshipモデルで多対多の実装、Messageモデルでチャットルームの実装を加えようと思っていた。実際、実装まではしたが、アプリの内容を考えて複雑化すると考え、今回は削除した。次回、別のアプリで小さく実装してみようと思う。


# 工夫した点、学んだ点

### とりあえず０→１を目指した
食わず嫌いをせず、大変そうな実装でもとりあえず挑戦してみた（実際は大した実装でもないのだろうけど…）。アプリを設計から実装完了までやり切ることに意味があると思ったので、とりあえずの完成できたので良かった。

### マークアップ言語の大切さ
フロントの実装で苦労したこともあり、勉強会で会った方に指導していただき、基本的なマークアップ言語の使い方とドキュメントの見方などを教わることができた。

### やればやるほど未熟だとわかる
知らないことを知れるという意味でとても良かった。作品を作ることで自分の立ち位置を再認識。未熟だと自覚しながらも、楽しいと思える気持ちは大きくなってきたので良かった。


# これから…
## AWSへのデプロイを目指す
* 全体像　https://github.com/itsuki23/infra-as-a-code
* terraformによるリソースの構築 https://github.com/itsuki23/infra-as-a-code/tree/master/terraform
* ansibleによるプロビジョニング https://github.com/itsuki23/infra-as-a-code/tree/master/ansible
* capistranoによるデプロイ　hitch_climb/capfile, hitch_climb/config/deploy.rb, hitch_climb/config/deploy/production.rb staging.rb, hitch_climb/lib/capistrano/tasks

    
# 自分用memo
terraform実行時の値を設定↓
* .env
* config/strage.yml
* config/deploy/production.yml
