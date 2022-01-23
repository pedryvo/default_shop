class Backoffice::SendMailController < ApplicationController
  before_action :set_admin, only: :edit


  def edit
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_message(current_admin, params[:'recipient-text'], params[:'subject-text'], params[:'message-text']).deliver_now
      @notify_message = 'E-mail enviado com sucesso!'
      @notify_flag = 'success'
    rescue
      @notify_message = 'Erro ao enviar e-mail. Tente novamente.'
      @notify_flag = 'error'
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
