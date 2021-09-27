class VotosController < PublicController


  def create
    ActiveRecord::Base.transaction do
      @enquete = Enquete.find(params[:enquete_id])

      if !@enquete.aceita_votos?
        redirect_to enquete_path(@enquete), flash: { error: 'Esta enquete não está aceitando votos.' }
      end
  
      if @enquete.tipo_opcoes?
        opcoes_escolhidas = Opcao.where(enquete: @enquete, id: JSON.parse(params[:opcoes_escolhidas_ids]))
        if opcoes_escolhidas.size > @enquete.qtd_votos
          return redirect_to enquete_path(@enquete), flash: { error: 'Você não pode escolher uma quantidade maior de opções.' }
        end
        Voto.where(enquete: @enquete, usuario: current_user).delete_all
        opcoes_escolhidas.each do |opcao|
          Voto.create!(enquete: @enquete, usuario: current_user, opcao: opcao)
        end
        flash[:notice] = "Voto salvo com sucesso!"
        return redirect_to enquete_path(@enquete), flash: { notice: 'Voto salvo com sucesso!' }
      end

      if @enquete.tipo_texto_livre?
        @voto = Voto.where(enquete: @enquete, usuario: current_user).take
        @voto ||= Voto.new(enquete: @enquete, usuario: current_user)
        @voto.conteudo = params[:conteudo]
        @voto.justificativa = params[:justificativa]
        @voto.ip = request.remote_ip
        @voto.save!
        flash[:notice] = "Voto salvo com sucesso!"
        return redirect_to enquete_path(@enquete), flash: { notice: 'Voto salvo com sucesso!' }
      end
    end
  rescue => e
    Rails.logger.error(e.message)
    return redirect_to enquete_path(@enquete), flash: { error: e.message }
  end
end
