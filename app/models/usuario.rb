class Usuario < ApplicationRecord
  has_many :votos
  enum tipo_documento: { cpf: 1, cnpj: 2 }, _prefix: true
  validates :tipo_documento, presence: true
  validates :documento, presence: true

  def display_name
    return "#{nome} / #{documento} (desativado)" unless ativo?

    "#{nome} / #{documento}"
  end

  def short_name
    nome.split(' ').first
  end

  scope :buscar, ->(documento:) { where(documento: documento&.gsub(/[^0-9]/, '')) }
end
