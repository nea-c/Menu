


data modify storage menu: macro.s set from storage menu: macro.list[-1]



# append用データ作成
data modify storage menu: macro.append set value {}

# widthがあるなら設定
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width

# label
function menu:dialog/actions/label/0
# tooltip
function menu:dialog/actions/tooltip/0
# action
function menu:dialog/actions/action/0

# append
data modify storage menu: macro.actions append from storage menu: macro.append






data remove storage menu: macro.list[-1]
execute if data storage menu: macro.list[-1] run function menu:dialog/actions/0.loop
