

# もしis_load:trueじゃないときに実行してたらERROR
execute unless data storage menu: {is_load:1b} run \
  return run function menu:_database/_please_not_execute


## ダイアログのメニューデータを作成する
# 記述方法は https://github.com/nea-c/MENU/_memo.md を読んでね


data modify storage menu: database append value {Page:0,type:"setting",columns:2,esc_close:true,title:{from_storage:"menu: _sample_text"}}
data modify storage menu: database append value {Page:0,type:"button",label:{from_storage:"menu: _sample_text"},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"run_command",value:"function menu:_sample_function",close:true}}
data modify storage menu: database append value {Page:0,type:"button",label:{text:"ページ1遷移"},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"page_change",value:1,close:false}}
data modify storage menu: database append value {Page:0,type:"exit_button",label:{text:"閉じるyo"},width:250}
data modify storage menu: database append value {Page:0,type:"body_text",contents:{text:"サンプル表示されてる～？"},width:300}
data modify storage menu: database append value {Page:0,type:"body_text",contents:{from_storage:"menu: _sample_text"},width:300}
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_storage:"menu: _sample_item"},width:16,description:{text:"test"}}
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_loot:"menu:_sample_item"},width:16,description:{text:"test"}}

data modify storage menu: database append value {Page:1,type:"setting",columns:1,esc_close:true,title:{from_storage:"menu: _sample_text"}}
data modify storage menu: database append value {Page:1,type:"button",label:{from_storage:"menu: _sample_text"},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"run_command",value:"function menu:_sample_function",close:true}}
data modify storage menu: database append value {Page:1,type:"exit_button",label:{text:"戻ってください"},width:250,action:{type:"page_change",value:0,close:false}}
