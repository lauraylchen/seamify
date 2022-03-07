class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.sender = current_user
    if @message.save
      redirect_to conversation_path(@conversation, anchor: "message-#{@message.id}")
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
