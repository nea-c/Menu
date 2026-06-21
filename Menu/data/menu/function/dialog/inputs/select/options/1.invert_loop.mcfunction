

data modify storage menu: macro.invert append from storage menu: macro.s.options[-1]


data remove storage menu: macro.s.options[-1]
execute if data storage menu: macro.s.options[-1] run function menu:dialog/inputs/select/options/1.invert_loop

