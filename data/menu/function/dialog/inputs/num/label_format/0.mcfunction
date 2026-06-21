
# label_format.from_storageの時は別処理へ移動
execute if data storage menu: macro.s.label_format.from_storage run \
  return run function menu:dialog/inputs/num/label_format/1.from_storage

# 特に↑で条件がなければlabel_formatをそのまま変更
data modify storage menu: macro.append.label_format set from storage menu: macro.s.label_format

