class CustomerMailer < ActionMailer::Base
  layout 'email'
  default from: "heidi@bohokitty.com"

  def purchase_confirmation(charge)
    @charge = charge

    mail to: charge.email, subject: 'BohoKitty Purchase'
  end
end
