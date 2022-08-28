require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'Criando paciente com cpf invalido' do
    paciente = Paciente.new nome: 'Joao Victor', nascimento: '2001-03-15',
                            cpf: '123.465.6a8-89', email: 'biruleibe@bol.com'
    assert_not paciente.save
  end
  test 'Criando paciente com email invalido' do
    paciente = Paciente.new nome: 'Joao Victor', nascimento: '2001-03-15',
                            cpf: '123.465.6a8-89', email: 'biruleibedasilva'
    assert_not paciente.save
  end
end
