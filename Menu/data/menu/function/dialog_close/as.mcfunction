
# そもそもPageスコアを持ってないならcloseするものもないので中断
execute unless entity @s[scores={MenuPage=-2147483648..2147483647}] run \
  return fail


# ダイアログ削除
function menu:button/_dialog_clear




