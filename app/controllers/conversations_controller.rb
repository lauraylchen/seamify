class ConversationsController < ApplicationController
  def index
    if current_user.seamstress
      @conversations = Conversation.where(seamstress_id: current_user.id)
    else
      @conversations = Conversation.where(client_id: current_user.id)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @seamstress = @conversation.seamstress
    @message = Message.new
  end

  def contact
    @seamstress = User.find(params[:seamstress_id])
    @client = current_user
    @conversation = Conversation.where(["seamstress_id = ? and client_id = ?", @seamstress.id, @client.id]).first
    if @conversation.present?
      redirect_to conversation_path(@conversation)
    else
      create
    end
  end

  def create
    @conversation = Conversation.new
    @conversation.client = @client
    @conversation.seamstress = @seamstress
    @conversation.name = "#{@client.first_name} / #{@seamstress.first_name}"
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render "users/show"
    end
  end
end
