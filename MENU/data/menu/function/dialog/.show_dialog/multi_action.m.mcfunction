

$dialog show @s \
  {\
    type: "multi_action",\
    can_close_with_escape: $(can_close_with_escape)b,\
    columns: $(columns),\
    after_action: "none",\
    pause: false,\
    title: $(title),\
    body: $(body),\
    inputs: $(inputs),\
    exit_action: $(exit_action),\
    actions: $(actions),\
  }


return 1


