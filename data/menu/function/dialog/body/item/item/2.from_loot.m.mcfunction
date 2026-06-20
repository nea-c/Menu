

# シュルカーを空に
execute in menu: run data modify block 0 0 0 Items set value []

# loot_tableを呼び出す
$execute in menu: run loot replace block 0 0 0 container.0 loot $(from_loot)

# ストレージへデータコピー
execute in menu: run data modify storage menu: macro.append.item set from block 0 0 0 Items[0]

