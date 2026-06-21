

# データがなければ中断
execute unless data storage menu: macro.s.options[-1] run \
  return run data modify storage menu: error set value {text:"のinput_selectのoptionsが存在しません",color:"#ff0000"}


# データを逆転
data modify storage menu: macro.invert set value []
function menu:dialog/inputs/select/options/1.invert_loop

# 逆転したデータを順番に処理
function menu:dialog/inputs/select/options/2.loop

