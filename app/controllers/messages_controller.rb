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

end
