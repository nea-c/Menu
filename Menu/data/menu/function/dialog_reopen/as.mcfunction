
# そもそもPageスコアを持ってないなら開くものもないので中断
execute unless entity @s[scores={MenuPage=-2147483648..2147483647}] run \
  return fail


# ダイアログ再描画
execute store result storage menu: CallPage int 1 run scoreboard players get @s MenuPage
function menu:dialog/1.call

