class HomePage < SitePrism::Page

    set_url '/'
    element :campoEmail, '#user_email'
    element :campoSenha, '#user_password'
    element :botaoLogar, 'input[value="Entrar"]'

    def logarAluno(email,senha)
        campoEmail.set email
        campoSenha.set senha
        botaoLogar.click
    end
end