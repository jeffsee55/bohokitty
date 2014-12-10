class CustomerMailer < ActionMailer::Base
  default from: "heidi@bohokitty.com"

  def purchase_confirmation(charge)
    email = charge.email
    mail(to: email, subject: "Purchase from BohoKitty")
  end
end
