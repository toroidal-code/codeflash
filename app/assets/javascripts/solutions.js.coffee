# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $.setAjaxPagination = ->
    $('.pagination a').click (event) ->
      event.preventDefault()
      loading = $ '<div id="loading" style="display: none;"><span><img src="/assets/loading.gif" alt="cargando..."/></span></div>'
      $('.other_images').prepend loading
      loading.fadeIn()
      $.ajax type: 'GET', url: $(@).attr('href'), dataType: 'script', success: (-> loading.fadeOut -> loading.remove())
      false

  $.setAjaxPagination()
