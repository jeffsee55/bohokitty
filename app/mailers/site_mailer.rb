class SiteMailer < ActionMailer::Base
  layout 'email'
  default from: "heidi@bohokitty.com"

  def purchase_confirmation(charge)
    @charge = charge

    mail to: charge.email, subject: 'BohoKitty Purchase'
  end

  def message_notifier(message)
    @message = message
    if @product_name
      @product_name = Product.find(message.product_id).name
    end
    mail to: "heidi@bohokitty.com"
  end
end
