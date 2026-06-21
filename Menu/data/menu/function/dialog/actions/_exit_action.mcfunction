

# append用データ作成
data modify storage menu: macro.append set value {label:"閉じる"}

# widthがあるなら設定
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width

# label
function menu:dialog/actions/1.label.m with storage menu: macro.s
# tooltip
function menu:dialog/actions/2.tooltip.m with storage menu: macro.s
# action
function menu:dialog/actions/action/0
# actionデータがないなら番号をそのまま適応
execute unless data storage menu: macro.s.action run function menu:dialog/actions/action/1.trigger_button.m with storage menu: macro.s

# append
data modify storage menu: macro.exit_action set from storage menu: macro.append
