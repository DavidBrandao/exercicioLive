Dado("que eu tenho um usuario") do |table|
@email = table.rows_hash['email']
@senha = table.rows_hash['senha'] 
home.load
end

Quando("eu faco login") do
home.logarAluno('davfb.ferreira@gmail.com','david123')
end

Entao("eu verifico se estou logado") do
expect(page).to have_current_path('https://enem.appprova.com.br/',url: true)
expect(page).to have_content("Escolha uma maneira de jogo e comece já:")
end