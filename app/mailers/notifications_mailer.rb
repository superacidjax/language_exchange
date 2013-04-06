class NotificationsMailer < ActionMailer::Base
  default from: "do-not-reply@pourandpedal.com"

  def message_notification(recipient, sender)
    @recipient = recipient
    @sender = sender
    login_url
    mail(to: recipient.email, subject: "New Message from Language Board!")
  end

  def login_url
    if Rails.env.development?
      @url = "http://0.0.0.0:3000/"
    else
      @url = "http://language-board.herokuapp.com"
    end
  end

end
