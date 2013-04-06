class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def environment_url(user)
    if Rails.env.development?
      @url = "http://0.0.0.0:3000/password_resets/#{user.reset_password_token}/edit"
    else
      @url = "http://language-board.herokuapp.com//password_resets/#{user.reset_password_token}/edit"
    end
  end


  def reset_password_email(user)
    @user = user
    environment_url(@user)
    mail(:to => user.email,
         :subject => "Language Board: Your password has been reset")
  end
end

end
