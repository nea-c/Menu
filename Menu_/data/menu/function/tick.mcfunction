
# トリガーした人を基準に実行
execute as @a[scores={MenuButton=-2147483648..2147483647}] \
  unless entity @s[scores={MenuButton=0}] at @s run function menu:button/0.check

