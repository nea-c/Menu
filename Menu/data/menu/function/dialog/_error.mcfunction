
tellraw @s {translate:"[Menu] ERROR: Page%s\n %s",color:"#ff0000",with:[{nbt:"macro.Page",storage:"menu:"},{nbt:"error",storage:"menu:",interpret:true}]}
data remove storage menu: error

