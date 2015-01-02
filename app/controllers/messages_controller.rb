class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      SiteMailer.message_notifier(@message).deliver
      redirect_to :back, notice: "Your inquiry has been sent, we will be in touch shortly!"
    else
      redirect_to :back, notice: "We could not process your request because #{@message.errors.full_messages.each { |msg| msg }}"
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :body, :product_id)
    end
end
