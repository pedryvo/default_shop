class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]


  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
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
    if @admin.update(admin_params)
      redirect_to backoffice_admins_path, notice: "O admin (#{@admin.email}) foi editada com sucesso."
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
