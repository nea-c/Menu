

# actionデータがないなら中断
execute unless data storage menu: macro.s.action run \
  return fail


# dynamic/run_commandの時は別処理へ移動
execute if data storage menu: macro.s.action{type:"dynamic/run_command"} run \
  return run function menu:dialog/actions/action/dynamic_run_command/0


# ButtonNumberをそのまま適応
function menu:dialog/actions/action/1.trigger_button.m with storage menu: macro.s

