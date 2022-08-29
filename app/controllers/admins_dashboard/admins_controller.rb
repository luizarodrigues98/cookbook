class AdminsDashboard::AdminsController < AdminsDashboardController
  before_action :set_admin, only: [:edit, :update, :destroy]
  before_action :verify_password, only: :update
  def index
    @admins = Admin.all.order(:id)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_dashboard_admins_path, notice: 'Administrador cadastrado com sucesso!'
    else
      render :new
    end    
  end
  
  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_dashboard_admins_path, notice: 'Administrador atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admins_dashboard_admins_path, notice: "Administrador excluido com sucesso!"
    else 
      render :index
    end 
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def verify_password
    if admin_params[:password].blank? && admin_params[:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end
end
