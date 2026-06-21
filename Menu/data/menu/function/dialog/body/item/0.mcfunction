

# append用データ作成
data modify storage menu: macro.append set value {type:"item", item:{}}

# widthがあるなら設定
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width

# show_tooltipがあるなら設定
execute if data storage menu: macro.s.show_tooltip run data modify storage menu: macro.append.show_tooltip set from storage menu: macro.s.show_tooltip

# show_decorationがあるなら設定
execute if data storage menu: macro.s.show_decoration run data modify storage menu: macro.append.show_decoration set from storage menu: macro.s.show_decoration

# item
execute if data storage menu: macro.s.item run function menu:dialog/body/item/item/0

# description
execute if data storage menu: macro.s.description run function menu:dialog/body/item/1.description.m with storage menu: macro.s


# append
data modify storage menu: macro.body append from storage menu: macro.append

