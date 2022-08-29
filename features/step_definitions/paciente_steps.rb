Given('Estou na pagina de cadastrar paciente') do
  visit '/pacientes/new'
  expect(page).to have_current_path('/pacientes/new')
end
When('eu preencho os dados nome {string} nascimento {string} cpf {string} email {string} cep {string} cidade {string} bairro {string} logradouro {string} complemento {string}') do |nome, nascimento, cpf, email, cep, cidade, bairro, logradouro, complemento|
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[nascimento]', :with => nascimento
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
end

When('eu clico no botao criar paciente') do
  click_button 'Create Paciente'
end

Then('vejo que cadastro do paciente foi efetuado com sucesso') do
  expect(page).to have_current_path(pacientes_path + '/' + Paciente.last.id.to_s)
end

Then('vejo a mensagem email invalido') do
  expect(page).to have_content('Email is invalid')
end

