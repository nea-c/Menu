

# from_storageの時は別処理へ移動
execute if data storage menu: macro.s.item.from_storage run \
  return run function menu:dialog/body/item/item/1.from_storage.m with storage menu: macro.s.item

# from_lootの時は別処理へ移動
execute if data storage menu: macro.s.item.from_loot run \
  return run function menu:dialog/body/item/item/2.from_loot.m with storage menu: macro.s.item


# 特に上で中断されてなければそのまま突っ込む
data modify storage menu: macro.append.item set from storage menu: macro.s.item
