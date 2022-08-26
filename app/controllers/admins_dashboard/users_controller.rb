class AdminsDashboard::UsersController < AdminsDashboardController
  def index
    @users = User.all.order(:id)
    
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_dashboard_users_path, notice: 'Usuário atualizado com sucesso!'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end