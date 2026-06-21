

# from_storageのデータをコピー
function menu:dialog/_from_storage_text.m with storage menu: macro.s.contents

# コピーしたデータを元に名前取得
data modify storage menu: macro.append.contents set from storage menu: macro.txt

# append
data modify storage menu: macro.body append from storage menu: macro.append


