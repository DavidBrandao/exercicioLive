Dir[File.join(File.dirname(__FILE__),
              '../pages/*_page.rb')].each {|file|require file}

module Pages
    def home
        @home ||= HomePage.new
    end

    def pagina_aluno
        @pagina_aluno ||= AlunoPage.new
    end
end