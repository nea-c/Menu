
# 最後尾データを入手
data modify storage menu: macro.s set from storage menu: database[-1]

# ボタン番号割り当て
function menu:_database/2.assign_number

# 変更後データを移動
data modify storage menu: macro._ append from storage menu: macro.s

# 最後尾データを削除して次へ
data remove storage menu: database[-1]
execute if data storage menu: database[-1] run function menu:_database/1.loop
