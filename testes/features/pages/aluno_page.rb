class AlunoPage < SitePrism::Page

    element :sair, 'a[href="/users/destroy_session"]'

    def deslogar
    sair.click
    end
    
end