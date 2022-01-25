class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index


  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to backoffice_admins_path, notice: "O admin #{@admin.email} foi criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    pwd = params[:admin][:password]
    pwd_confirmation = params[:admin][:password_confirmation]

    if pwd.blank? && pwd_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation) 
    end


    if @admin.update(admin_params)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "O admin (#{@admin.email}) foi editado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O admin (#{admin_email}) foi excluído com sucesso."
    else
      redirect_to backoffice_admins_path
    end
  end

  private

  def admin_params
    if @admin.blank?
      params.require(:admin).permit(:email, :name, :role, :password, :password_confirmation)
    else
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
