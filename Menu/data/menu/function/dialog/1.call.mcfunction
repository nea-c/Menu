
# メニューボタンのtriggerを有効化
scoreboard players enable @s MenuButton

# macro.pageに入っている値を使って該当番号のデータを呼び出す
data modify storage menu: macro.data set value []
function menu:dialog/2.get_page_data.m with storage menu: macro

# そもそもデータがなければERROR
execute unless data storage menu: macro.data[-1] run \
  return run tellraw @s {translate:"[Menu] ERROR: ページ%sのデータが存在しません",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"}]}

# exit_buttonのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"exit_button"}]
execute store result score # MenuButton run data get storage menu: macro._
  # 複数存在していたらERROR
  execute if score # MenuButton matches 2.. run \
    return run tellraw @s {translate:"[Menu] ERROR: ページ%sのexit_buttonが複数存在しています",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"}]}
  # 存在しなければ追加
  execute unless score # MenuButton matches 1.. run \
    data modify storage menu: macro.data append from storage menu: database[{ButtonNumber:-1}]

# settingのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"setting"}]
execute store result score # MenuButton run data get storage menu: macro._
  # 複数存在していたらERROR
  execute if score # MenuButton matches 2.. run \
    return run tellraw @s {translate:"[Menu] ERROR: ページ%sのsettingが複数存在しています",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"}]}


# 生成用ストレージを初期化
data modify storage menu: macro merge value {dialog_type:"multi_action",body:[],inputs:[],actions:[],exit_action:"",title:'""',can_close_with_escape:true,columns:2}

# settingを適応
data remove storage menu: macro.s
data modify storage menu: macro.s set from storage menu: macro.data[{type:"setting"}]
execute if data storage menu: macro.s.columns run data modify storage menu: macro.columns set from storage menu: macro.s.columns
execute if data storage menu: macro.s.esc_close run data modify storage menu: macro.can_close_with_escape set from storage menu: macro.s.esc_close
execute if data storage menu: macro.s.title run function menu:dialog/3.title.m with storage menu: macro.s

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

# exit_actionを処理
data modify storage menu: macro.exit_action set value {}
data remove storage menu: macro.s
data modify storage menu: macro.s set from storage menu: macro.data[{type:"exit_button"}]
execute if data storage menu: macro.s run function menu:dialog/actions/_exit_action



# errorがあったらERROR
execute if data storage menu: error run tellraw @s {translate:"[Menu] ERROR: ページ%s%s",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"},{nbt:"error",storage:"menu:",interpret:true}]}
execute if data storage menu: error run return run data remove storage menu: error


## show
execute if data storage menu: macro{dialog_type:"multi_action"} store success storage menu: macro.success byte 1 run function menu:dialog/.show_dialog/multi_action.m with storage menu: macro
# showに失敗していたらERROR
execute unless data storage menu: macro{success:true} run \
  return run tellraw @s {translate:"[Menu] ERROR: ページ%sの表示に失敗しました",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"}]}


# 開いているページを設定
execute store result score @s MenuPage run data get storage menu: macro.Page


