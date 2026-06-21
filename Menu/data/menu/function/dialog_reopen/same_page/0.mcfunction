
# そもそもPageスコアを持ってないならreopenするものもないので中断
execute unless entity @s[scores={MenuPage=-2147483648..2147483647}] run \
  return fail


# 自分のPageスコアと同じページを開いている人のダイアログを再描画
execute store result storage menu: CallPage int 1 run scoreboard players operation # MenuPage = @s MenuPage
execute as @a if score @s MenuPage = # MenuPage run function menu:dialog/0.start





