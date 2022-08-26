class AdminsDashboard::AdminsController < AdminsDashboardController
  def index
    @admins = Admin.all.order(:id)
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
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

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
