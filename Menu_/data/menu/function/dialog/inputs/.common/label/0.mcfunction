
# label.from_storageの時は別処理へ移動
execute if data storage menu: macro.s.label.from_storage run \
  return run function menu:dialog/inputs/.common/label/1.from_storage

# 特に↑で条件がなければlabelをそのまま変更
data modify storage menu: macro.append.label set from storage menu: macro.s.label

