

# append用データ作成
data modify storage menu: macro.append set value {type:"text", key:"", label:"", multiline:{max_lines:1}}

# 各種設定があるなら上書き
execute if data storage menu: macro.s.key run data modify storage menu: macro.append.key set from storage menu: macro.s.key
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width
execute if data storage menu: macro.s.height run data modify storage menu: macro.append.multiline.height set from storage menu: macro.s.height
execute if data storage menu: macro.s.max_line run data modify storage menu: macro.append.multiline.max_lines set from storage menu: macro.s.max_line
execute if data storage menu: macro.s.max_length run data modify storage menu: macro.append.max_length set from storage menu: macro.s.max_length

# label
execute if data storage menu: macro.s.label run function menu:dialog/inputs/.common/label.m with storage menu: macro.s
  # labelが存在しないなら非表示
  execute unless data storage menu: macro.s.label run data modify storage menu: macro.append.label_visible set value false
# initial
function menu:dialog/inputs/.common/initial/0


# append
data modify storage menu: macro.inputs append from storage menu: macro.append

