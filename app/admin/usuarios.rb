ActiveAdmin.register Usuario do

  form do |f|
    f.semantic_errors
    f.inputs do
      input :nome
      input :tipo_documento
      input :documento
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :nome
    column :documento
    column :visto_em
    column :ultimo_ip
    actions
  end
  permit_params :documento
end
