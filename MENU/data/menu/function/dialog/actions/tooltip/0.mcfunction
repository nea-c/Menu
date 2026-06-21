

# from_storageの時は別処理へ移動
execute if data storage menu: macro.s.tooltip.from_storage run \
  return run function menu:dialog/actions/tooltip/1.from_storage

# 特に↑で条件がなければcontentsをそのまま変更
data modify storage menu: macro.append.tooltip set from storage menu: macro.s.tooltip
