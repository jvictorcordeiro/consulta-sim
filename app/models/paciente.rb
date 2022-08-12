require 'cpf_cnpj'

class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  has_many :consultums, dependent: :destroy
  has_many :medicos, through: :consultums

  validates :nome, presence: true, length: {in: 3..50}
  validate :nascimento_valido
  validate :cpf_valido #, presence: true, format: { with: /A([0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\.?[0-9]{2})z/}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}

  def nascimento_valido
    if nascimento.present? && nascimento > Date.today
      errors.add(:nascimento, ': Data de nascimento invalida')
    end
  end
  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf,'formato ou numero invalido')
    end
  end
end
