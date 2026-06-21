

$dialog show @s \
  {\
    type: "confirmation",\
    can_close_with_escape: $(can_close_with_escape)b,\
    after_action: "none",\
    pause: false,\
    title: $(title),\
    body: $(body),\
    inputs: $(inputs),\
    yes: $(action),\
    no: $(exit_action),\
  }


return 1


