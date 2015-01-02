$ ->
  document.querySelector("#cvc, #address_line1, #address_country").addEventListener "keydown", (e) ->
    e.preventDefault()  if e.which is 9
    return


  message_button = $('#new_message input[type="submit"]')
  message_button.prop('disabled', true)
  $('#message_body, #message_name').keyup ->
    if $(@).val()
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
  $('#message_body, #message_name, #message_email').keyup ->
    if $('.valid_field').length == 3
      message_button.prop('disabled', false)
    else
      message_button.prop('disabled', true)
  $('#message_email').blur ->
    email_re = new RegExp("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$")
    email = $(@).val()
    if email_re.test(email)
      $(@).parent().removeClass('invalid_field')
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
      $(@).parent().addClass('invalid_field')



  date = new Date()
  month = date.getMonth() + 1
  year = date.getFullYear()
  $('#credit_card_number').payment('formatCardNumber')
  $('#exp_month').payment('formatExpiryMonth')
  $('#exp_year').payment('formatExpiryYear')
  $('#cvc').payment('formatCardCVC')
  shipping_button = $("#payment-form .modal-shipping")
  additional_button = $("#payment-form .modal-details")
  shipping_button.prop('disabled', true)
  additional_button.prop('disabled', true)






  $('#name').keyup ->
    if $(@).val()
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
  $('#charge_email').blur ->
    email_re = new RegExp("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$")
    email = $(@).val()
    if email_re.test(email)
      $(@).parent().removeClass('invalid_field')
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
      $(@).parent().addClass('invalid_field')
  $('#credit_card_number').keyup ->
    if $(@).val().length == 19
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
  $('#exp_month').keyup ->
    if $(@).val().length == 2
      if $(@).val() >= month and $(@).val() <= 12
        $(@).parent().removeClass('invalid_field')
        $(@).parent().addClass('valid_field')
      else
        $(@).parent().removeClass('valid_field')
        $(@).parent().addClass('invalid_field')
    else
      $(@).parent().removeClass('valid_field')
      $(@).parent().removeClass('invalid_field')
  $('#exp_year').keyup ->
    if $(@).val().length == 4
      if $(@).val() >= year
        $(@).parent().removeClass('invalid_field')
        $(@).parent().addClass('valid_field')
      else
        $(@).parent().removeClass('valid_field')
        $(@).parent().addClass('invalid_field')
    else
      $(@).parent().removeClass('valid_field')
      $(@).parent().removeClass('invalid_field')
  $('#cvc').keyup ->
    if $(@).val().length >= 3
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')


  $('#name, #charge_email, #credit_card_number,
  #exp_year, #exp_month, #cvc').keyup ->
    if $('.credit-card .valid_field').length == 6
      shipping_button.prop('disabled', false)
    else
      shipping_button.prop('disabled', true)

  $('#name, #charge_email, #credit_card_number,
  #exp_year, #exp_month, #cvc').blur ->
    if $('.credit-card .valid_field').length == 6
      shipping_button.prop('disabled', false)
    else
      shipping_button.prop('disabled', true)


  $('#address_line1, #address_line2,
  #address_city, #address_state, #address_zip, #address_country').change ->
    if $(@).val()
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
    if $('.shipping .valid_field').length >= 4
      additional_button.prop('disabled', false)
    else
      additional_button.prop('disabled', true)

  $('#address_line1, #address_line2,
  #address_city, #address_state, #address_zip, #address_country').keyup ->
    if $(@).val()
      $(@).parent().addClass('valid_field')
    else
      $(@).parent().removeClass('valid_field')
    if $('.shipping .valid_field').length >= 4
      additional_button.prop('disabled', false)
    else
      additional_button.prop('disabled', true)
