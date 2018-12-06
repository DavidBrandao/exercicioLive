#language:pt

Funcionalidade: Fazer login

-Eu como aluno
-Eu quero fazer login na plataforma

    @deslogar_aluno
    Cenario: Fazer login com sucesso
        Dado que eu tenho um usuario
        |email|davfb.ferreira@gmail.com|
        |senha|david123                |
        Quando eu faco login
        Entao eu verifico se estou logado

