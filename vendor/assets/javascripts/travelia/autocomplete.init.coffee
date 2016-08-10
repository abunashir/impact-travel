$ ->
  $("#search_destination").autocomplete
    source: "/destinations"

    select: (event, ui) ->
      $("#search_destination").val ui.item.label
      $("#search_location_id").val ui.item.value
      false

    focus: (event, ui) ->
      $("#search_destination").val ui.item.label
      false
