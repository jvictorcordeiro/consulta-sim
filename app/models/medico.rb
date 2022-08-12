require "cpf_cnpj"
class Medico < ApplicationRecord
  has_many :consultums, dependent: :destroy
  has_many :pacientes, through: :consultums

  validates :nome, presence:true, length: {in: 3..50}
  validate :cpf_valido
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :especialidade, presence: true, length: {in: 3..30}
  validates :crm, presence: true, length: {maximum: 10}, numericality: {only_integer: true}

  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf,"formato ou numero invalido")
    end
  end
end
