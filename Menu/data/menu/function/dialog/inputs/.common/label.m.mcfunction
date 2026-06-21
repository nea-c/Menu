


$execute in menu: run loot replace block 0 0 0 container.0 loot {pools:[{rolls:1,entries:[{type:"item",name:"debug_stick",functions:[{function:"set_name",entity:"this",target:"item_name",name:$(label)}]}]}]}
execute in menu: run data modify storage menu: macro.append.label set from block 0 0 0 Items[0].components."minecraft:item_name"

