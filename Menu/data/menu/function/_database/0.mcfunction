

# もしis_load:trueじゃないときに実行してたらERROR
execute unless data storage menu: {is_load:1b} run \
  return run function menu:_database/_please_not_execute


## ダイアログのメニューデータを作成する
# 記述方法は https://github.com/nea-c/MENU/blob/master/usage.md を読んでね
