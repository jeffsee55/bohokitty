$ ->

  Stripe.setPublishableKey(ENV["STRIPE_PUBLISHABLE_KEY"])
  $('#payment-form').submit((event) ->
    # disable the submit to prevent repeated clicks
    $('input[type="submit"]').attr('disabled', 'disabled')

    Stripe.createToken({
      name: $('#name').val(),
      number: $('#credit_card_number').val(),
      cvc: $('#cvc').val(),
      exp_month: $('#exp_month').val(),
      exp_year: $('#exp_year').val(),
      address_line1: $('#address_line1').val(),
      address_line2: $('#address_line2').val(),
      address_city: $('#address_city').val(),
      address_state: $('#address_state').val(),
      address_zip: $('#address_zip').val(),
      address_country: $('#address_country').val(),
    }, stripeResponseHandler)

    # prevent the form from submitting with the default action
    return false
  )


  stripeResponseHandler = (status, response) ->
    if(response.error)
      console.log(response.error)
      # reenable the submit button
      $('input[type="submit"]').removeAttr('disabled')
      # show the errors on the form
      $('.payment-errors').html(response.error.message)
    else
      form$ = $('#payment-form')
      # token contains last4, cart type, and id
      token = response['id']
      # insert the token back in to the form so it gets submitted
      form$.append("<input type='hidden'
        name='stripe_token' value='" + token + "'/>")
      # and submit
      console.log(token)
      form$.get(0).submit()
