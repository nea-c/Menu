

# データが複数存在している場合にtrueを返す


# buttonのデータ個数を確認
data modify storage menu: macro._ set value []
data modify storage menu: macro._ append from storage menu: macro.data[{type:"button"}]
  # 複数存在していたらERROR
  execute if data storage menu: macro._[-2] run \
    return run data modify storage menu: error set value {text:"buttonが複数ありますが、タイプはconfirmationです"}

