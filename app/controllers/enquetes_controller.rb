class EnquetesController < PrivateController
  def index
    @enquetes = Enquete.status_concluida.order(:finaliza_em, :desc) if params[:status] == 'concluida'
    @enquetes ||= Enquete.status_publicada.order(:finaliza_em, :desc)
  end

  def show
    @enquete = Enquete.find(params[:id])
    if @enquete.tipo_opcoes?
      @opcoes_escolhidas_ids = Opcao.joins(:votos).where(enquete: @enquete, votos: { usuario_id: current_user.id }).pluck(:id)
      @opcoes_escolhidas_ids ||= []
      @opcoes = @enquete.opcoes.order(:nome)
      @votos_contador = Voto.where(enquete: @enquete).group(:opcao_id).count
    end

    if @enquete.tipo_texto_livre?
      @voto = Voto.joins(:usuario).where(enquete: @enquete, usuario: current_user).take
      @voto ||= Voto.new
    end
  end

  # def create
  #   @enquete = Enquete.find(params[:enquete_id])

  #   if !@enquete.aceita_votos?
  #     flash['error'] = 'Esta enquete não está aceitando votos.'
  #     redirect_to enquete_path(@enquete), flash: { error: 'Esta enquete não está aceitando votos.' }
  #   end

  #   @voto = Voto.new(enquete: @enquete)
  # end
end
