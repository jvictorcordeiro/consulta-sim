class Consultum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validate :data_valida
  validate :horario_valido
  # validates :paciente, presence: true
  # validates :medico, presence: true

  def data_valida
    if data.present? && data < Date.today
      errors.add(:data, "indisponível ou inválida")
    end
  end
  def horario_valido
    if %w[08:00 08:30 09:00 09:30 10:00 10:30 11:00 11:30 15:00 15:30 16:00 16:30].exclude? horario
      errors.add(:horario, "indisponível ou inválido")
    end
  end
end
