$ ->
  $(document).on "focus", ".lang_search", ->
    $(".lang_search").autocomplete source: $(".lang_search").data("autocomplete-source")
  $("#datepicker").datepicker()
  $("#f2f").click ->
    $("#f2finfo").fadeIn 500
    $("#f2f").attr('class', 'btn-success btn')
    $('#checkerf2f').prop('checked', true)
    return false
  $("#f2fok").click ->
    $("#f2finfo").hide 200
    return false
  $("#f2fcancel").click ->
    $('#checkerf2f').prop('checked', false)
    $("#f2f").attr('class', 'btn')
    $("#f2finfo").hide 200
    return false
  $("#emailbutton").click ->
    $("#emailinfo").fadeIn 500
    $("#emailbutton").attr('class', 'btn-success btn')
    $('#checkeremail').prop('checked', true)
    return false
  $("#emailok").click ->
    $("#emailinfo").hide 200
    return false
  $("#emailcancel").click ->
    $('#checkeremail').prop('checked', false)
    $("#emailbutton").attr('class', 'btn')
    $("#emailinfo").hide 200
    return false
  $("#skypebutton").click ->
    $("#skypeinfo").fadeIn 500
    $("#skypebutton").attr('class', 'btn-success btn')
    $('#checkerskype').prop('checked', true)
    return false
  $("#skypeok").click ->
    $("#skypeinfo").hide 200
    return false
  $("#skypecancel").click ->
    $('#checkerskype').prop('checked', false)
    $("#skypebutton").attr('class', 'btn')
    $("#skypeinfo").hide 200
    return false
  $("#facebookbutton").click ->
    $("#facebookinfo").fadeIn 500
    $("#facebookbutton").attr('class', 'btn-success btn')
    $('#checkerfacebook').prop('checked', true)
    return false
  $("#facebookok").click ->
    $("#facebookinfo").hide 200
    return false
  $("#facebookcancel").click ->
    $('#checkerfacebook').prop('checked', false)
    $("#facebookbutton").attr('class', 'btn')
    $("#facebookinfo").hide 200
    return false
  $("#msnbutton").click ->
    $("#msninfo").fadeIn 500
    $("#msnbutton").attr('class', 'btn-success btn')
    $('#checkermsn').prop('checked', true)
    return false
  $("#msnok").click ->
    $("#msninfo").hide 200
    return false
  $("#msncancel").click ->
    $('#checkermsn').prop('checked', false)
    $("#msnbutton").attr('class', 'btn')
    $("#msninfo").hide 200
    return false