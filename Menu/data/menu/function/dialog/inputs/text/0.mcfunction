

# append用データ作成
data modify storage menu: macro.append set value {type:"text", key:"", label:""}

# 各種設定があるなら上書き
execute if data storage menu: macro.s.key run data modify storage menu: macro.append.key set from storage menu: macro.s.key
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width
execute if data storage menu: macro.s.init run data modify storage menu: macro.append.initial set from storage menu: macro.s.init


# label
execute if data storage menu: macro.s.label run function menu:dialog/inputs/.common/label.m with storage menu: macro.s
  # labelが存在しないなら非表示
  execute unless data storage menu: macro.s.label run data modify storage menu: macro.append.label_visible set value false

# options
execute if data storage menu: macro.s.options run function menu:dialog/inputs/select/options/0

# append
data modify storage menu: macro.inputs append from storage menu: macro.append

