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
      @url = "http://language-board.herokuapp.com/password_resets/#{user.reset_password_token}/edit"
    end
  end

  def activation_url(user)
    if Rails.env.development?
      @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    else
      @url = "http://language-board.herokuapp.com/users/#{user.activation_token}/activate"
    end
  end

  def login_url
    if Rails.env.development?
      @url = "http://0.0.0.0:3000/sign_in"
    else
      @url = "http://language-board.herokuapp.com/sign_in"
    end
  end



  def reset_password_email(user)
    @user = user
    environment_url(@user)
    mail(:to => user.email,
         :subject => "Language Board: Your password has been reset")
  end



  def activation_needed_email(user)
    @user = user
    activation_url(@user)
    mail(:to => user.email,
         :subject => "Welcome to Language Board")
  end

  def activation_success_email(user)
    @user = user
    login_url
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end


end
