class SessionController < PublicController
  def index
  end

  def create
    usuario = Usuario.buscar(documento: params[:documento]).where(ativo: true).take if params[:documento].present?
    if usuario
      session[:usuario_id] = usuario.id if usuario.present?
      redirect_to '/'
    else
      flash['error'] = 'Usuário não encontrado ou desativado.'
      render 'index'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
