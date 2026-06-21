

# from_storageのデータをコピー
function menu:dialog/_from_storage_text.m with storage menu: macro.s.label_format

# コピーしたデータを元に名前取得
data modify storage menu: macro.append.label_format set from storage menu: macro.txt
