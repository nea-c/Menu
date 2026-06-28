
# メニューボタンのtriggerを有効化
scoreboard players enable @s MenuButton

# CallPageに入っている値を使って該当番号のデータを呼び出す
data modify storage menu: macro set value {}
function menu:dialog/2.get_page_data.m with storage menu:


# visible.from_storageのある特殊なデータを抽出
data modify storage menu: macro.list set value []
data modify storage menu: macro.list append from storage menu: macro.data[{visible:{}}]
# データが存在するならloop処理へ移行
execute if data storage menu: macro.list[-1] run function menu:dialog/_visible_from_storage/0.loop

# visible:falseを削除
data remove storage menu: macro.data[{visible:false}]


# そもそもデータがなければERROR
execute unless data storage menu: macro.data[-1] run \
  return run tellraw @s {translate:"[Menu] ERROR: ページ%s\n データが存在しません",color:"#ff0000",with:[{nbt:"CallPage",storage:"menu:"}]}

# exit_buttonのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"exit_button"}]
  # 複数存在していたらERROR
  execute if data storage menu: macro._[-2] run \
    return run tellraw @s {translate:"[Menu] ERROR: ページ%s\n exit_buttonが複数存在しています",color:"#ff0000",with:[{nbt:"CallPage",storage:"menu:"}]}
  # 存在しなければ追加
  execute unless data storage menu: macro._[-1] run \
    data modify storage menu: macro.data append from storage menu: database[{ButtonNumber:-1}]

# settingのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"setting"}]
  # 複数存在していたらERROR
  execute if data storage menu: macro._[-2] run \
    return run tellraw @s {translate:"[Menu] ERROR: ページ%s\n settingが複数存在しています",color:"#ff0000",with:[{nbt:"CallPage",storage:"menu:"}]}


# 生成用ストレージを初期化
data modify storage menu: macro merge value {dialog_type:"multi_action",body:[],inputs:[],actions:[],exit_action:"",title:'""',can_close_with_escape:true,columns:2}

# settingを適応
data remove storage menu: macro.s
data modify storage menu: macro.s set from storage menu: macro.data[{type:"setting"}]
execute if data storage menu: macro.s.columns run data modify storage menu: macro.columns set from storage menu: macro.s.columns
execute if data storage menu: macro.s.esc_close run data modify storage menu: macro.can_close_with_escape set from storage menu: macro.s.esc_close
execute unless data storage menu: macro.s.title.italic run data modify storage menu: macro.s.title.italic set value false
execute if data storage menu: macro.s.title run function menu:dialog/3.title.m with storage menu: macro.s
execute if data storage menu: macro.s.dialog_type run data modify storage menu: macro.dialog_type set from storage menu: macro.s.dialog_type


# confirmationの時、buttonが複数あったらERROR
execute if data storage menu: macro{dialog_type:"confirmation"} if function menu:dialog/4.confirmation_data_check run return run function menu:dialog/_error



# bodyを処理
data modify storage menu: macro.list set value []
data modify storage menu: macro.list append from storage menu: macro.data[{attribute:"body"}]
execute if data storage menu: macro.list[-1] run function menu:dialog/body/0.loop

# inputsを処理
data modify storage menu: macro.list set value []
data modify storage menu: macro.list append from storage menu: macro.data[{attribute:"inputs"}]
execute if data storage menu: macro.list[-1] run function menu:dialog/inputs/0.loop

# actionsを処理
data modify storage menu: macro.list set value []
data modify storage menu: macro.list append from storage menu: macro.data[{type:"button"}]
execute if data storage menu: macro.list[-1] run function menu:dialog/actions/0.loop
  # confirmationの時、actionsをリストじゃなくする
  execute if data storage menu: macro{dialog_type:"confirmation"} run data modify storage menu: macro.action set from storage menu: macro.actions[0]


# exit_actionを処理
data modify storage menu: macro.exit_action set value {}
data remove storage menu: macro.s
data modify storage menu: macro.s set from storage menu: macro.data[{type:"exit_button"}]
execute if data storage menu: macro.s run function menu:dialog/actions/_exit_action



# errorがあったらERROR
execute if data storage menu: error run return run function menu:dialog/_error


## show
execute if data storage menu: macro{dialog_type:"notice"} store success storage menu: macro.success byte 1 run function menu:dialog/.show_dialog/notice.m with storage menu: macro
execute if data storage menu: macro{dialog_type:"confirmation"} store success storage menu: macro.success byte 1 run function menu:dialog/.show_dialog/confirmation.m with storage menu: macro
execute if data storage menu: macro{dialog_type:"multi_action"} store success storage menu: macro.success byte 1 run function menu:dialog/.show_dialog/multi_action.m with storage menu: macro
# showに失敗していたらERROR
execute unless data storage menu: macro{success:true} run \
  return run tellraw @s {translate:"[Menu] ERROR: ページ%s\n 表示に失敗しました",color:"#ff0000",with:[{nbt:"CallPage",storage:"menu:"}]}


# 開いているページを設定
execute store result score @s MenuPage run data get storage menu: CallPage


