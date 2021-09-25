class EnquetesController < PrivateController
  def index
    @enquetes = Enquete.status_publicada
  end

  def show
    @enquete = Enquete.find(params[:id])
    @opcoes_escolhidas_ids = Opcao.joins(:votos).where(enquete: @enquete, votos: { usuario_id: current_user.id }).pluck(:id)
    @opcoes_escolhidas_ids ||= []
    @voto = Voto.joins(:usuario).where(enquete: @enquete, usuario: current_user).take
    @voto ||= Voto.new
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
