

# append用データ作成
data modify storage menu: macro.append set value {type:"plain_message", contents:{}}

# widthがあるなら設定
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width


# contentsを変換
function menu:dialog/body/text/1.from_storage.m with storage menu: macro.s


# append
data modify storage menu: macro.body append from storage menu: macro.append

