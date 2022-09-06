class AdminsDashboard::UsersController < AdminsDashboardController
  before_action :set_user, except: :index
  
  def index
    @users = User.all.order(:id).page(params[:page]).per(5)
    
  end
  def edit
  end

  def update
    if user_params[:password].blank? && user_params[:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end

    if @user.update(user_params)
      redirect_to admins_dashboard_users_path, notice: 'Usuário atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admins_dashboard_users_path, notice: "Administrador excluido com sucesso!"
    else 
      render :index
    end 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end