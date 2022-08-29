Given('Estou na pagina de cadastrar medico') do
  visit '/medicos/new'
  expect(page).to have_current_path('/medicos/new')
end

When('eu preencho os dados nome {string} cpf {string} email {string} especialidade {string} crm {string}') do |nome, cpf, email, especialidade, crm|
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm
end

When('eu clico no botao criar medico') do
  click_button 'Create Medico'
end

Then('vejo que cadastro do medico foi efetuado com sucesso') do
  expect(page).to have_current_path(medicos_path + '/' + Medico.last.id.to_s)
end
