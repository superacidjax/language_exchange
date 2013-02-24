$ ->
  $(document).on "focus", ".lang_search", ->
    $(".lang_search").autocomplete source: $(".lang_search").data("autocomplete-source")
