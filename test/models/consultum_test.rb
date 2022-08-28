require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test 'Criando consulta vazia' do
    consulta = Consultum.new
    assert_not consulta.save
  end
  test 'Criando consulta com dados válidos' do
    paciente = Paciente.new nome: 'Joao Victor', nascimento: '2001-03-15',
                            cpf: '78647415094', email: 'biruleibe@bol.com'
    assert paciente.save
    medico = Medico.new nome: 'Nathalia', cpf: '20710275072',
                        email: 'nathalia@bol.com', especialidade: 'pediatra', crm: '3015'
    assert medico.save
    consulta = Consultum.new data: Date.today, horario: '10:00', paciente_id: paciente.id, medico_id: medico.id
    assert consulta.save
  end
end
