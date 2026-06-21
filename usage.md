
# 記述方法一覧

* #### Page
> INT

表示したいページ番号  
0番が`function #menu:`で呼び出されるデフォルトページです

* #### type
> TEXT

宣言タイプ  
`setting` `button` `exit_button` `body_text` `body_item` `input_bool` `input_num` `input_select` `input_text`

`button` はダイアログのタイプが`multi_action` `confirmation`の時専用です  
`confirmation`の時に`button`が2つ以上あるとエラーを出力します


## type: `setting`
<details>
<summary>クリックして詳細を表示</summary>

###  sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"setting",dialog_type:"multi_action",columns:2,esc_close:true,title:{nbt:"_sample_text",storage:"menu_sample:",interpret:true}}
```

* #### dialog_type
> NULL/STRING

ダイアログのタイプ  
`multi_action` `notice` `confirmation`  
表記しなければ自動的に`multi_action`が割り当てられます

* #### columns
> NULL/INT

ボタンの列数  
表記しなければ自動的に2が割り当てられます  
`dialog_type: multi_action`専用

* #### esc_close
> NULL/BOOL

Escキーで閉じれるかどうか  
表記しなければ自動的にtrueが割り当てられます

* #### title
> NULL/COMPOUND

タイトル表記  
表記しなければ自動的に`""`が割り当てられます  
直テキスト(`label:"あああ"`のような形式)は動作保証外

</details>

## type: `button` `exit_button`
<details>
<summary>クリックして詳細を表示</summary>

###  sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"button",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},tooltip:{text:"サンプル表示されてる～？"},width:150,action:{type:"run_command",value:"function menu_sample:_sample_function",close:true}}
data modify storage menu: database append value {Page:0,type:"exit_button",label:{text:"閉じる"}}
```

* #### label
> COMPOUND

ボタン名  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### tooltip
> NULL/COMPOUND

ホバー時の表示  
表記しなければ何もなしになります  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### width
> NULL/INT

ボタン幅  
表記しなければ自動で150に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"button"}].width`とかに対して値変更を行えば楽かも

* #### action
> NULL/COMPOUND

ボタン押下時の挙動  
表記しなければ何もしないボタンになります  
type: `run_command` `dynamic/run_command` `page_change` `dialog_close`  
close: このボタンを押したときにダイアログを閉じるか  
```md
> NULL/BOOL
typeがdynamic/run_command以外の時に有効
trueの場合、このボタンを押したときにダイアログを閉じます
```
value: typeに応じた実行内容  
```md
# run_command
> STRING
通常のコマンドを入力
"function menu:_sample_function"等
```
```md
# dynamic/run_command
> STRING
通常のダイナミックコマンドを入力
"give @s diamond $(count)"等
```
```md
# page_change
> INT
遷移したいページ番号を入力
```
```md
# dialog_close
> NULL
宣言の必要がありません
exit_buttonが存在しないとき、このactionが登録されたボタンが自動的に生成されます
また、typeがexit_buttonの時にactionデータが未記入の場合は、自動的にこれが割り当てられます
```


</details>


## type: `body_text`
<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"body_text",contents:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},width:200}
```

* #### contents
> COMPOUND

内容  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### width
> NULL/INT

ボタン幅  
表記しなければ自動で200に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"body_text"}].width`とかに対して値変更を行えば楽かも

</details>

## type: `body_item`
<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_storage:"menu_sample: _sample_item"},width:16,description:{text:"test"}}
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_loot:"menu_sample:_sample_item"},width:16,description:{text:"test"}}
```

* #### item
> COMPOUND

表示するアイテム  
`{from_storage:"menu_sample: _sample_item"}`のようなストレージ参照の形式を記述すると自動で変換します  
`{from_loot:"menu_sample:_sample_item"}`のようなルートテーブル参照の形式を記述すると自動で変換します

* #### show_tooltip
> NULL/BOOL

アイテム情報の表示  
表記しなければ自動でtrueに割り当てられます

* #### show_decoration
> NULL/BOOL

アイテムの個数や耐久値を表示するか  
表記しなければ自動でtrueに割り当てられます

* #### description
> NULL/COMPOUND

アイテムの右側に表示される文章  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### width
> NULL/INT

ボタン幅  
表記しなければ自動で16に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"body_item"}].width`とかに対して値変更を行えば楽かも

</details>




## type: `input_bool`
<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"input_bool",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"a",init:false,on_true:"true",on_false:"false"}
```

* #### label
> COMPOUND

ボタン名  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### key
> STRING

dynamic/run_commandの時に使用するキー  

* #### init
> NULL/BOOL/COMPOUND

初期値  
表記しなければ自動でfalseに割り当てられます  
`{from_storage:"menu_sample: _sample_bool"}`のようなストレージ参照の形式を記述すると自動で変換します

* #### on_true
> NULL/STRING

表記しなければ自動で"true"に割り当てられます

* #### on_false
> NULL/STRING

表記しなければ自動で"false"に割り当てられます

</details>


## type: `input_num`

<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"input_num",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"a",width:200,init:1,start:0,end:100,step:1}
```

* #### label
> COMPOUND

ボタン名  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### label_format
> NULL/STRING

ボタン名カスタム

* #### key
> STRING

dynamic/run_commandの時に使用するキー

* #### width
> NULL/INT

スライダー幅  
表記しなければ自動で200に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"input_num"}].width`とかに対して値変更を行えば楽かも

* #### init
> NULL/INT/COMPOUND

初期値  
表記しなければ自動でfalseに割り当てられます  
`{from_storage:"menu_sample: _sample_bool"}`のようなストレージ参照の形式を記述すると自動で変換します

* #### start
> INT

スライダーの最小値

* #### end
> INT

スライダーの最大値

* #### step
> NULL/INT

スライダーの増減値

</details>



## type: `input_select`
<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"input_select",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"a",width:200,init:{from_storage:"menu_sample: _sample_input_select_id"},options:[{id:"num_1",display:{text:"表示1"}},{id:"num_2",display:{text:"表示2"}}]}
```

* #### label
> NULL/COMPOUND

ボタン名  
表記しなければ自動でラベルが非表示になります  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### key
> STRING

dynamic/run_commandの時に使用するキー  

* #### width
> NULL/INT

ボタン幅  
表記しなければ自動で200に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"input_select"}].width`とかに対して値変更を行えば楽かも

* #### init
> NULL/STRING/COMPOUND

初期値になるデータID  
↓のidに当たる部分と同じデータをtrueにします



* #### options
> COMPOUND_LIST

選択肢内容  
id: dynamic/run_commandに転送される値  
```md
> NULL/STRING
表記しなければ自動で""に割り当てられます
```
display: 表示名  
```md
> NULL/COMPOUND
表記しなければ自動でvalueの値が表示されます
直テキスト(`display:"あああ"`のような形式)は動作保証外
```

</details>




## type: `input_text`
<details>
<summary>クリックして詳細を表示</summary>

### sample
```mcfunction
data modify storage menu: database append value {Page:0,type:"input_text",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"a",width:200,init:{from_storage:"menu_sample: _sample_input_text"}}
```

* #### label
> NULL/COMPOUND

ボタン名  
表記しなければ自動でラベルが非表示になります  
直テキスト(`label:"あああ"`のような形式)は動作保証外

* #### key
> STRING

dynamic/run_commandの時に使用するキー  

* #### width
> NULL/INT

入力欄の幅  
表記しなければ自動で200に割り当てられます  
幅を一律で変更したい場合、`menu: database[{Page:0,type:"input_text"}].width`とかに対して値変更を行えば楽かも

* #### max_line
> NULL/INT

入力可能な最大行数  
表記しなければ自動で1に割り当てられます

* #### height
> NULL/INT

入力欄の高さ  
表記しなければ自動調整機能を使用します


* #### init
> NULL/STRING/COMPOUND

初期値になるデータID  
optionsのidに当たる部分と同じ文字のデータをtrueにします  
`{from_storage:"menu_sample: _sample_input_text"}`のようなストレージ参照の形式を記述すると自動で変換します

* #### max_length
> NULL/INT

文字数  
表記しなければ自動で32に割り当てられます



</details>

