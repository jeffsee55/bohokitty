$ ->
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
