ready = ->
  $("#viewin").click ->
    $("#inbox, #hidein, #viewin").toggle()
  $("#hidein").click ->
    $("#inbox, #hidein, #viewin").toggle()

  $("#viewout").click ->
    $("#outbox, #hideout, #viewout").toggle()
  $("#hideout").click ->
    $("#outbox, #hideout, #viewout").toggle()

$(document).ready(ready)
$(document).on('page:load', ready)
