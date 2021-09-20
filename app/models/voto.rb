class Voto < ApplicationRecord
  belongs_to :enquete
  belongs_to :usuario
  belongs_to :opcao, optional: true

  validates :conteudo, presence: true, allow_blank: false, if: proc { enquete.tipo_texto_livre? }
end
