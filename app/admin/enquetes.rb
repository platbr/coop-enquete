ActiveAdmin.register Enquete do

  form do |f|
    f.semantic_errors
    f.inputs do
      input :tipo
      input :status
      input :qtd_votos
      input :finaliza_em
      input :nome
      input :descricao
    end
    f.inputs do
      f.has_many :opcoes, heading: 'Opções', allow_destroy: true, new_record: true do |env|
        env.input :nome
        env.input :descricao
      end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :tipo
    column :status
    column :qtd_votos
    column :finaliza_em
    column :nome
    actions
  end

  permit_params :tipo, :status, :qtd_votos, :finaliza_em, :nome, :descricao,
                opcoes_attributes: %i[id nome descricao _destroy]
end
