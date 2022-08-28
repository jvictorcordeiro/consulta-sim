require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'Criando medico com crm invalido' do
    medico = Medico.new nome: 'Nathalia', cpf: '20710275072',
                        email: 'nathalia@bol.com', especialidade: 'pediatra', crm: '30a5'
    assert_not medico.save
  end

  test 'Criando medico com dados validos' do
    medico = Medico.new nome: 'Nathalia', cpf: '20710275072',
                        email: 'nathalia@bol.com', especialidade: 'pediatra', crm: '3015'
    assert medico.save
  end
end
