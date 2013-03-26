class MessagesController < ApplicationController

  before_filter :require_login
  before_filter :the_right_user,  only: [:edit, :update, :destroy]

  expose(:message)

  def index
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages
  end

  def show
    Message.read_message(message.id, message.recipient)
  end

  def send_message
    recipient = User.find(params[:user].to_i)
    sender = User.find(params[:sender].to_i)
    message = Message.new
    message.subject = params[:subject]
    message.body = params[:message]
    message.sender = sender
    message.recipient = recipient
    message.save
    if message.save
      redirect_to user_path(recipient), notice: "Message sent"
      else
      end
    end

end
