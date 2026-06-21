

# append用データ作成
data modify storage menu: macro.append set value {type:"plain_message", contents:{}}

# widthがあるなら設定
execute if data storage menu: macro.s.width run data modify storage menu: macro.append.width set from storage menu: macro.s.width



# from_storageの時は別処理へ移動
execute if data storage menu: macro.s.contents.from_storage run \
  return run function menu:dialog/body/text/1.from_storage



# 特に↑で条件がなければcontentsをそのまま変更
data modify storage menu: macro.append.contents set from storage menu: macro.s.contents

# append
data modify storage menu: macro.body append from storage menu: macro.append

