


data modify storage menu: macro.s set from storage menu: macro.list[-1]


execute if data storage menu: macro.s{type:"body_text"} run function menu:dialog/body/text/0
execute if data storage menu: macro.s{type:"body_item"} run function menu:dialog/body/item/0


data remove storage menu: macro.list[-1]
execute if data storage menu: macro.list[-1] run function menu:dialog/body/0.loop
