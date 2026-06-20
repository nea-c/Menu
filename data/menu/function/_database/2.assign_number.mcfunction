

# そもそもbutton,exit_buttonじゃなければ中断
execute unless data storage menu: macro.s{type:"button"} unless data storage menu: macro.s{type:"exit_button"} run \
  return fail


# actionのtypeがdynamic/run_commandなら中断
execute if data storage menu: macro.s.action{type:"dynamic/run_command"} run \
  return fail


# 番号付与
execute store result storage menu: macro.s.ButtonNumber int 1 run scoreboard players add # MenuButton 1

