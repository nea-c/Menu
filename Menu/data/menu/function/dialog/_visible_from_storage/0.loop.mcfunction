
function menu:dialog/_visible_from_storage/1.replace.m with storage menu: macro.list[-1].visible

data remove storage menu: macro.list[-1]
execute if data storage menu: macro.list[-1] run function menu:dialog/_visible_from_storage/0.loop

