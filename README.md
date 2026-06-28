
# Menu

データを使用して動的ダイアログメニューを表示するライブラリデータパック

## 最新

r7

## 動作要件

MinecraftJE 1.21.11 ~

## 使用方法

1. `menu/tags/function/_database.json`をあなたのデータパックに作成し、以下の例のように記入
```json
{
  "values": [
    "menu_sample:_database"
  ]
}
```
2. jsonに追加したfunction内に[記述方法一覧](https://github.com/nea-c/Menu/blob/master/usage.md)のようにデータを記述します

3. `function #menu:open`で0番をコールします


> [!CAUTION]
> このライブラリでは、ページを開いていることをMenuPageスコアで見ています  
> 他のデータパックからダイアログを上書き表示する際は必ずリセットしてください



## 提供されるfunctionタグ
`#menu:open`
> ページ番号0をコールします。

`#menu:call`
> `data modify storage menu: CallPage set value <INT>`を入力後、  
> `function #menu:call`を実行すると`<INT>`に入力された対象ページを開きます

`#menu:page_open.m`
> `function #menu:page_open.m {Page:<INT>}`で`<INT>`に入力された対象ページを開きます

`#menu:_database`
> [!WARNING]
> functionコマンドから**絶対**に実行しないでください

`#menu:reopen/as`
> 実行者の開いているメニューを再描画します

`#menu:reopen/same_page`
> 実行者と同じページを開いている人に対してメニューを再描画します

`#menu:reopen/everyone`
> メニューを開いている全員のメニューを再描画します

`#menu:close/as`
> 実行者がメニューを開いている場合、メニューを閉じます

`#menu:close/everyone`
> メニューを開いている全員のメニューを閉じます



## MenuSampleについて

使用方法の例としておいておきます  
参考程度に使ってください

## ライセンス

[Apache 2.0 Licence](https://github.com/nea-c/Menu/blob/master/LICENSE)に基づく


## 更新履歴

* r7
  * `setting`のtitleに`{text:"日本語"}`のようなデータを入れていた際にメニューが開けなくなる問題の修正

* r6
  * 記述データに[visible](https://github.com/nea-c/Menu/blob/master/usage.md#visible)オプションを追加

* r5
  * `#menu:reopen/as`を追加

* r4
  * `#menu:reopen/same_page`がページ0を開く問題の修正

* r3
  * `#menu:call`を追加

* r2
  * `#menu:page_open.m`を追加

* r1
  * 初版

