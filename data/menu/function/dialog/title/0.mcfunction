

# append用データ作成
data modify storage menu: macro.append set value {}


# from_storageの時は別処理へ移動
execute if data storage menu: macro.s.title.from_storage run \
  return run function menu:dialog/title/1.from_storage


# 特に↑で条件がなければcontentsをそのまま変更
data modify storage menu: macro.title set from storage menu: macro.s.title
