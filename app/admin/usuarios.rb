ActiveAdmin.register Usuario do

  form do |f|
    f.semantic_errors
    f.inputs do
      input :documento
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :documento
    column :visto_em
    column :ultimo_ip
    actions
  end
  permit_params :documento
end
