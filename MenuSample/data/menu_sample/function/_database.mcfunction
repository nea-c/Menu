



data modify storage menu: database append value {Page:0,type:"setting",dialog_type:"confirmation",columns:2,esc_close:true,title:{nbt:"_sample_text",storage:"menu_sample:",interpret:true}}
data modify storage menu: database append value {Page:0,type:"button",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"run_command",value:"function menu_sample:_sample_function",close:true}}
# data modify storage menu: database append value {Page:0,type:"button",label:{text:"ぢなみっくこまんど"},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"dynamic/run_command",value:'tellraw @a "$(a)"',close:true}}
# data modify storage menu: database append value {Page:0,type:"button",label:{text:"ページ1遷移"},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"page_change",value:1,close:false}}
data modify storage menu: database append value {Page:0,type:"exit_button",label:{text:"閉じるyo"},width:250}
data modify storage menu: database append value {Page:0,type:"body_text",contents:{text:"サンプル表示されてる～？"},width:300}
data modify storage menu: database append value {Page:0,type:"body_text",contents:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},width:300}
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_storage:"menu_sample: _sample_item"},width:16,description:{text:"test"}}
data modify storage menu: database append value {Page:0,type:"body_item",item:{from_loot:"menu_sample:_sample_item"},width:16,description:{text:"test"}}

data modify storage menu: database append value {Page:0,type:"input_bool",label:{text:"これはテストinputダヨ"},key:"c",init:{from_storage:"menu_sample: _sample_bool"},on_true:"true",on_false:"false"}
data modify storage menu: database append value {Page:0,type:"input_num",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"k",width:200,init:{from_storage:"menu_sample: _sample_int"},start:0,end:100,step:1}

data modify storage menu: database append value {Page:0,type:"input_select",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"g",width:200,options:[{id:"num_1",display:{text:"表示1"}},{id:"num_2",display:{text:"表示2"}}]}
# data modify storage menu: database append value {Page:0,type:"input_select",label:{text:"オプションなしtest"},key:"e",width:200,options:[]}
data modify storage menu: database append value {Page:0,type:"input_select",label:{text:"displayなしオプション"},key:"h",width:200,init:{from_storage:"menu_sample: _sample_input_select_id"},options:[{id:"num_1"},{id:"num_2"},{id:"num_3"},{id:"num_4"}]}

data modify storage menu: database append value {Page:0,type:"input_text",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},key:"a",width:200,init:{from_storage:"menu_sample: _sample_input_text"}}






data modify storage menu: database append value {Page:1,type:"setting",columns:1,esc_close:true,title:{nbt:"_sample_text",storage:"menu_sample:",interpret:true}}
data modify storage menu: database append value {Page:1,type:"button",label:{nbt:"_sample_text",storage:"menu_sample:",interpret:true},tooltip:{text:"サンプル表示されてる～？"},width:100,action:{type:"run_command",value:"function menu_sample:_sample_function",close:true}}
data modify storage menu: database append value {Page:1,type:"exit_button",label:{text:"戻ってください"},width:250,action:{type:"page_change",value:0,close:false}}

