
# Menu

データを使用して動的ダイアログメニューを表示するライブラリデータパック

## 最新

r1

## 動作要件

MinecraftJE 1.21.11 ~

## 使用方法

`menu/tags/function/_database.json`をあなたのデータパックに作成し、以下の例のように記入
```json
{
  "values": [
    "menu_sample:_database"
  ]
}
```
jsonに追加したfunction内に[記述方法一覧](https://github.com/nea-c/Menu/blob/master/usage.md)のようにデータを記述します  
`function #menu:open`で0番をコールします


> [!IMPORTANT]
> このライブラリでは、ページを開いていることをMenuPageスコアで見ています  
> 他のデータパックからダイアログを上書き表示する際は必ずリセットしてください



## 提供されるfunctionタグ
`#menu:open`
> ページ番号0をコールします。

`#menu:_database`
> [!CAUTION]
> functionコマンドから**絶対**に実行しないでください

`#menu:reopen/same_page`
> 実行者と同じページを開いている人に対してメニューを再描画します

`#menu:reopen/everyone`
> メニューを開いている全員のメニューを再描画します

`#menu:close/as`
> メニューを開いている場合、メニューを閉じます

`#menu:close/everyone`
> メニューを開いている全員のメニューを閉じます


## MenuSampleについて

使用方法の例としておいておきます  
参考程度に使ってください

## ライセンス

[Apache 2.0 Licence](https://github.com/nea-c/Menu/blob/master/LICENSE)に基づく


## 更新履歴

* r1
  * 初版

