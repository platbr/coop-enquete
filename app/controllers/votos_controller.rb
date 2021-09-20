class VotosController < PublicController


  def create
    @enquete = Enquete.find(params[:enquete_id])

    if !@enquete.aceita_votos?
      redirect_to enquete_path(@enquete), flash: { error: 'Esta enquete não está aceitando votos.' }
    end

    @voto = Voto.where(enquete: @enquete, usuario: current_user).take
    @voto ||= Voto.new(enquete: @enquete, usuario: current_user)
    @voto.conteudo = params[:conteudo]
    @voto.justificativa = params[:justificativa]
    @voto.ip = request.remote_ip
    if @voto.save
      flash[:notice] = "Voto salvo com sucesso!"
      redirect_to enquete_path(@enquete), flash: { notice: 'Voto salvo com sucesso!' }
    else
      redirect_to enquete_path(@enquete), flash: { error: 'Seu voto não pode ser salvo' }
    end
  end
end
