class Backoffice::SendMailController < ApplicationController
  before_action :set_admin, only: :edit


  def edit
    respond_to do |format|
      format.js {  }
    end
  end

  def create
    
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
