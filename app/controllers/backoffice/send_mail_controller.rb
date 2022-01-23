class Backoffice::SendMailController < ApplicationController
  before_action :set_admin, only: :edit


  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    AdminMailer.send_message(current_admin, params[:'recipient-text'], params[:'subject-text'], params[:'message-text']).deliver_now
    
    respond_to do |format|
      format.js
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
