
After '@deslogar_aluno' do
    #click_link 'Sair'
    #find('a[href="/users/destroy_session"]').click
    pagina_aluno.deslogar
end

# tirar o print e remover espaços e virgulas
After do |scenario|
    
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    scenario_name = scenario_name.delete(',', '')
    scenario_name = scenario_name.delete('(', '')
    scenario_name = scenario_name.delete(')', '')
    scenario_name = scenario_name.delete('#', '')

# se o cenario falhar chamar o metodo take passando dois parametros nome do cenario(lowercase) e resultado
  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end
end