
# option.idとinitが一致するならinitialをtrueにする
execute store success storage menu: macro.success byte 1 run data modify storage menu: macro.option.id set from storage menu: macro.s.initial
execute if data storage menu: macro{success:false} run data modify storage menu: macro.append_option.initial set value true

