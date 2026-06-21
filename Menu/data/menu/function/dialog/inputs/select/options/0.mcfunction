

# データがなければ中断
execute unless data storage menu: macro.s.options[-1] run \
  return run data modify storage menu: error set value {text:"input_selectのoptionsが存在しません"}


# データを逆転
data modify storage menu: macro.invert set value []
function menu:dialog/inputs/select/options/1.invert_loop

# 逆転したデータを順番に処理
function menu:dialog/inputs/select/options/2.loop

