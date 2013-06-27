# TODO refactor this to make it more readable and more CoffeeScript-like

$(document).ready ->
  $("#profilelang").select2()
  $("#solutionlang").select2().change ->
    str = undefined
    if $("#solutionlang option:selected").data().syntax is "none"
      str = null
    else
      str = "ace/mode/" + $("#solutionlang option:selected").data().syntax
    editor.getSession().setMode str  unless typeof (editor) is "undefined"

  str = undefined
  if $("#solutionlang option:selected").data()?
    if $("#solutionlang option:selected").data().syntax is "none"
      str = null
    else
      str = "ace/mode/" + $("#solutionlang option:selected").data().syntax
    editor.getSession().setMode str  unless typeof (editor) is "undefined"
  $(".accordion").on "expand collapse", (e) ->
    $(e.target)
      .siblings(".solution-heading")
      .find(".accordion-toggle i")
      .toggleClass "icon-angle-down icon-angle-right", 200

  $(".icon-heart-empty").hover ((e) ->
    $(this).toggleClass "icon-heart icon-heart-empty", 200
  ), ->
    $(this).toggleClass "icon-heart icon-heart-empty", 200

  $(".icon-heart").hover ((e) ->
    $(this).toggleClass "icon-heart icon-heart-empty", 200
  ), ->
    $(this).toggleClass "icon-heart icon-heart-empty", 200


deluxe_spinning_action = new Konami()
deluxe_spinning_action.code = ->
  $("i[class^=\"icon-\"], i[class*=\" icon-\"]").addClass "icon-spin"
  $("img").addClass "spin"

deluxe_spinning_action.load()
