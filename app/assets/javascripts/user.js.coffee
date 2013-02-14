$(document).ready ->

  # Multi select - allow multiple selections

  # Allow click without closing menu

  # Toggle checked state and icon
  $(".multicheck").click (e) ->
    $(this).toggleClass "checked"
    $(this).find("span").toggleClass "icon-ok"
    false


  # Single Select - allow only one selection




  # To check whether an item is checked use the hasClass method
  #alert $("#chkB").hasClass("checked")
