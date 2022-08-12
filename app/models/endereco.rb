class Endereco < ApplicationRecord
  belongs_to :paciente

  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true, message: "o cep deve ser no formato XXXXX-XXX"
  validates :cidade, presence:true, length: {in: 3..40}
  validates :bairro, presence:true, length: {in: 3..40}
  validates :logradouro, presence:true, length: {in: 3..40}
  validates :complemento, presence:true, length: {in: 3..50}
end
