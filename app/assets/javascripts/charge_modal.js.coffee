$ ->
  $('.modal-shipping').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '-250px')
    $(@).hide()
    $('.modal-purchase').hide()
    $('.modal-card').show()
    $('.modal-confirm').show()
  $('.modal-card').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '0px')
    $(@).hide()
    $('.modal-confirm').hide()
    $('.modal-purchase').hide()
    $('.modal-shipping').show()
  $('.modal-confirm').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '-500px')
    $(@).hide()
    $('.modal-card').hide()
    $('.modal-purchase').show()
    $('.modal-shipping').show()
