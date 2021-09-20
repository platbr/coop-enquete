class Enquete < ApplicationRecord
  has_many :votos
  has_many :opcoes

  enum tipo: { texto_livre: 1, opcoes: 2 }, _prefix: true
  enum status: { criada: 1, publicada: 2, concluida: 3, cancelada: 4 }, _prefix: true

  validates :tipo, presence: true
  validates :status, presence: true
  validates :qtd_votos, presence: true

  accepts_nested_attributes_for :opcoes, allow_destroy: true

  def display_name
    "#{id} - #{nome}"
  end

  def aceita_votos?
    return false unless status_publicada?
    return false if Time.current > finaliza_em

    true
  end
end