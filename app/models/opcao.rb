class Opcao < ApplicationRecord
  belongs_to :enquete
  has_many :votos
  validates :nome, presence: true

  def display_name
    nome || conteudo
  end
end
