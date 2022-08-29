Feature:
  As a paciente
  I want to adicionar cadastro de paciente
  So that nao precise fazer isso manualmente

  Scenario: cadastrar paciente
    Given Estou na pagina de cadastrar paciente
    When eu preencho os dados nome 'Joao' nascimento '2001-03-15' cpf '96435244006' email 'joaovcordeiro@gmail.com' cep '55292-750' cidade 'Garanhuns' bairro 'Boa vista' logradouro 'rua do nunca' complemento 'loteamento'
    And eu clico no botao criar paciente
    Then vejo que cadastro do paciente foi efetuado com sucesso