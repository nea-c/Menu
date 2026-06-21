

# buttonのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"button"}]
execute store result score # MenuButton run data get storage menu: macro._
  # 複数存在していたらERROR
  execute if score # MenuButton matches 2.. run \
    data modify storage menu: error set value {text:"buttonが複数ありますが、タイプはconfirmationです"}


