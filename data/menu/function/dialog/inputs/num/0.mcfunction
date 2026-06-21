

# append用データ作成
data modify storage menu: macro.append set value {type:"number_range", key:"", label:{}}

# 各種設定があるなら上書き
execute if data storage menu: macro.s.key run data modify storage menu: macro.append.key set from storage menu: macro.s.key
execute if data storage menu: macro.s.start run data modify storage menu: macro.append.start set from storage menu: macro.s.start
execute if data storage menu: macro.s.end run data modify storage menu: macro.append.end set from storage menu: macro.s.end
execute if data storage menu: macro.s.step run data modify storage menu: macro.append.step set from storage menu: macro.s.step
execute if data storage menu: macro.s.label_format run data modify storage menu: macro.append.label_format set from storage menu: macro.s.label_format

# label
function menu:dialog/inputs/.common/label/0
# initial
function menu:dialog/inputs/.common/initial/0


# append
data modify storage menu: macro.inputs append from storage menu: macro.append

