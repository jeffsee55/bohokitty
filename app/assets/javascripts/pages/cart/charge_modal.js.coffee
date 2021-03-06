$ ->
  $( "#charge_event_date" ).datepicker
    altFormat: "yy-mm-dd"
  $('.modal-shipping').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '-250px')
    $(@).hide()
    $('.modal-purchase').hide()
    $('.modal-card').show()
    $('.modal-details').show()
    $('.modal-details .forward').show()
    $('.modal-details .back').hide()
    $('.modal-confirm').hide()
  $('.modal-card').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '0px')
    $(@).hide()
    $('.modal-confirm').hide()
    $('.modal-purchase').hide()
    $('.modal-shipping').show()
    $('.modal-shipping .back').hide()
    $('.modal-shipping .forward').show()
    $('.modal-details').hide()
  $('.modal-details').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '-500px')
    $(@).hide()
    $('.modal-card').hide()
    $('.modal-confirm').show()
    $('.modal-purchase').hide()
    $('.modal-shipping').show()
    $('.modal-shipping .back').show()
    $('.modal-shipping .forward').hide()
  $('.modal-confirm').click (e) ->
    e.preventDefault()
    $('.form-fields').css('top', '-750px')
    $(@).hide()
    $('.modal-card').hide()
    $('.modal-purchase').show()
    $('.modal-shipping').hide()
    $('.modal-details').show()
    $('.modal-details .back').show()
    $('.modal-details .forward').hide()

  $('#address_line1, #address_line2, #address_city, #address_state, #address_zip, #address_country').focus ->
    $('.form-fields').css('top', '-250px')
