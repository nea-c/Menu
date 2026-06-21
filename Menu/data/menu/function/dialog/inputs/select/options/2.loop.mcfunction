

# 初期値を設定
data modify storage menu: macro.append_option set value {id:""}

# データ取り出し
data modify storage menu: macro.option set from storage menu: macro.invert[-1]

# 各種データがあれば上書き
execute if data storage menu: macro.option.id run data modify storage menu: macro.append_option.id set from storage menu: macro.option.id
execute if data storage menu: macro.option.display run function menu:dialog/inputs/select/options/3.display.m with storage menu: macro.option

# option.idとinitが一致するならinitialをtrueにする
execute if data storage menu: macro.s.init store success storage menu: macro.success byte 1 run data modify storage menu: macro.option.id set from storage menu: macro.s.init
execute if data storage menu: macro.s.init if data storage menu: macro{success:false} run data modify storage menu: macro.append_option.initial set value true

# 追加
data modify storage menu: macro.append.options append from storage menu: macro.append_option

# ループ
data remove storage menu: macro.invert[-1]
execute if data storage menu: macro.invert[-1] run function menu:dialog/inputs/select/options/2.loop

