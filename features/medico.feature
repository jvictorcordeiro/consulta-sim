Feature:
  As a medico
  I want to adicionar cadastro de medico
  So that nao precise fazer isso manualmente

  Scenario: cadastrar medico
    Given Estou na pagina de cadastrar medico
    When eu preencho os dados nome 'Luiz' cpf '54442719071' email 'tetsuga@gmail.com' especialidade 'ginecologista' crm '2050'
    And eu clico no botao criar medico
    Then vejo que cadastro do medico foi efetuado com sucesso