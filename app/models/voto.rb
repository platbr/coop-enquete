class Voto < ApplicationRecord
  belongs_to :enquete
  belongs_to :usuario
  belongs_to :opcao, optional: true


end
