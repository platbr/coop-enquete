ActiveAdmin.register Voto do
  actions :index, :show
  index do
    selectable_column
    id_column
    column :usuario
    column :enquete
    column :opcao
    column :conteudo
    actions
  end
  
end