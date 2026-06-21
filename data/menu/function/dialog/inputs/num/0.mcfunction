

# append用データ作成
data modify storage menu: macro.append set value {type:"number_range", key:"", label:{}}

# 各種設定があるなら上書き
execute if data storage menu: macro.s.key run data modify storage menu: macro.append.key set from storage menu: macro.s.key
execute if data storage menu: macro.s.init run data modify storage menu: macro.append.initial set from storage menu: macro.s.init
execute if data storage menu: macro.s.on_true run data modify storage menu: macro.append.on_true set from storage menu: macro.s.on_true
execute if data storage menu: macro.s.on_false run data modify storage menu: macro.append.on_false set from storage menu: macro.s.on_false


# label
function menu:dialog/inputs/.common/label/0
# initial
function menu:dialog/inputs/.common/initial/0
# label_format
function menu:dialog/inputs/num/label_format/0


# append
data modify storage menu: macro.inputs append from storage menu: macro.append

