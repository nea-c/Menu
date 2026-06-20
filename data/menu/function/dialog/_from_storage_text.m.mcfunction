
$data modify storage menu: macro.txt set from storage $(from_storage)

execute in menu: run loot replace block 0 0 0 container.0 loot {pools:[{rolls:1,entries:[{type:"item",name:"debug_stick",functions:[{function:"set_name",entity:"this",target:"item_name",name:{nbt:"macro.txt",storage:"menu:",interpret:true}}]}]}]}
execute in menu: run data modify storage menu: macro.txt set from block 0 0 0 Items[0].components."minecraft:item_name"
