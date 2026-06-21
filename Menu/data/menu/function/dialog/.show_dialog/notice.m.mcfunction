

$dialog show @s \
  {\
    type: "notice",\
    can_close_with_escape: $(can_close_with_escape)b,\
    after_action: "none",\
    pause: false,\
    title: $(title),\
    body: $(body),\
    inputs: $(inputs),\
    exit_action: $(exit_action),\
  }


return 1


