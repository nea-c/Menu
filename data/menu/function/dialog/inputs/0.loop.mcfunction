


data modify storage menu: macro.s set from storage menu: macro.list[-1]


execute if data storage menu: macro.s{type:"input_bool"} run function menu:dialog/inputs/bool/0
execute if data storage menu: macro.s{type:"input_num"} run function menu:dialog/inputs/num/0
execute if data storage menu: macro.s{type:"input_select"} run function menu:dialog/inputs/select/0
execute if data storage menu: macro.s{type:"input_text"} run function menu:dialog/inputs/text/0


data remove storage menu: macro.list[-1]
execute if data storage menu: macro.list[-1] run function menu:dialog/inputs/0.loop
