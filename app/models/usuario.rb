class Usuario < ApplicationRecord
  has_many :votos
  enum tipo_documento: { cpf: 1, cnpj: 2 }, _prefix: true
  validates :tipo_documento, presence: true
  validates :documento, presence: true
  validate :unique_documento?

  def display_name
    return "#{nome} / #{documento} (desativado)" unless ativo?

    "#{nome} / #{documento}"
  end

  def short_name
    nome.split(' ').first
  end

  def unique_documento?
    if Usuario.buscar(documento: documento).where.not(id: id).any?
      errors.add :documento, 'já está em uso por outro usuário.'

      return false
    end

    true
  end

  scope :buscar, ->(documento:) { where(documento: documento&.gsub(/[^0-9]/, '')) }
end
