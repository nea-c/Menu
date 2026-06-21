
execute store result storage menu: macro.num int 1 run scoreboard players get @s MenuButton
scoreboard players reset @s MenuButton


# 入手した番号と一致するデータを取得
data modify storage menu: macro.s set value {}
function menu:button/1.get_data.m with storage menu: macro


# action.closeがtrueならdialog clear
execute if data storage menu: macro.s.action{close:true} run function menu:button/_dialog_clear

# run_commandの場合
execute if data storage menu: macro.s.action{type:"run_command"} run \
  return run function menu:button/2.run_command.m with storage menu: macro.s.action

# exit_buttonで、かつactionがない場合はdialog clearして中断
execute if data storage menu: macro.s{type:"exit_button"} unless data storage menu: macro.s.action run \
  return run function menu:button/_dialog_clear

# exit_buttonで、かつactionがdialog_closeならdialog_clearして中断
execute if data storage menu: macro.s{type:"exit_button"} if data storage menu: macro.s.action{type:"dialog_close"} run \
  return run function menu:button/_dialog_clear

# page_changeの場合
execute if data storage menu: macro.s.action{type:"page_change"} run \
  return run function menu:button/3.page_change

