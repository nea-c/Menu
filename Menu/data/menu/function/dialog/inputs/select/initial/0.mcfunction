

# init.from_storageの時は別処理へ移動
execute if data storage menu: macro.s.init.from_storage run \
  return run function menu:dialog/inputs/select/initial/1.from_storage.m with storage menu: macro.s.init

# 特に↑で条件がなければinitialをそのまま変更
data modify storage menu: macro.s.initial set from storage menu: macro.s.init
