class Opcao < ApplicationRecord
  belongs_to :enquete
  validates :nome, presence: true

  def display_name
    nome || conteudo
  end
end
