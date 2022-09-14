# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


lista_usuario = [ {:username => "admin",  :password => "root", :user_type => "A"},
                  {:username => "normal",    :password => "123",  :user_type => "N"}]

lista_usuario.each do |u|
    user = User.new
    user.username = u[:username]
    user.password = u[:password]
    user.user_type = u[:user_type]
    user.save
end

lista_estados = [

    {:nome => "Acre",                :sigla => "AC"},
    {:nome => "Alagoas",             :sigla => "AL"},
    {:nome => "Amapá",               :sigla => "AP"},
    {:nome => "Amazonas",            :sigla => "AM"},
    {:nome => "Bahia",               :sigla => "BA"},
    {:nome => "Ceará",               :sigla => "CE"},
    {:nome => "Espírito Santo",      :sigla => "ES"},
    {:nome => "Goiás",               :sigla => "GO"},
    {:nome => "Maranhão",            :sigla => "MA"},

{:nome => "Mato Grosso",         :sigla => "MT"},
{:nome => "Mato Grosso do Sul",  :sigla => "MS"},
{:nome => "Minas Gerais",        :sigla => "MG"},
{:nome => "Pará",                :sigla => "PA"},
{:nome => "Paraíba",             :sigla => "PB"},
{:nome => "Paraná",              :sigla => "PR"},
{:nome => "Pernambuco",          :sigla => "PE"},
{:nome => "Piauí",               :sigla => "PI"},
{:nome => "Rio de Janeiro",      :sigla => "RJ"},
{:nome => "Rio Grande do Norte", :sigla => "RN"},
{:nome => "Rio Grande do Sul",   :sigla => "RS"},
{:nome => "Rondônia",            :sigla => "RO"},
{:nome => "Roraima",             :sigla => "RR"},
{:nome => "Santa Catarina",      :sigla => "SC"},
{:nome => "São Paulo",           :sigla => "SP"},
{:nome => "Sergipe",             :sigla => "SE"},
{:nome => "Tocantins",           :sigla => "TO"},
{:nome => "Distrito Federal",    :sigla => "DF"}

]


lista_estados.each do |e|
est = Estado.new ()
est.nome = e[:nome]
est.sigla = e[:sigla]
if est.invalid?
    puts "Registro inválido:"
    est.errors[:sigla].each do |s|
        puts "#{s}"
    end
    est.errors[:nome].each do |s|
        puts "#{s}"
    end
else
    est.save
end
end

lista_esportes = [

    {:nome_esporte => "Futebol"},
    {:nome_esporte => "Natação"},
    {:nome_esporte => "Volei"},
    {:nome_esporte => "Tênis"},
    {:nome_esporte => "Ping Pong"},
    {:nome_esporte => "Musculação"}

]


lista_esportes.each do |t|
    esp = Esporte.new()
    esp.nome_esporte = t[:nome_esporte]
    esp.save
end



lista_pessoas = [
    
    {:nome => "Joao",   :sobrenome => "Pereira",     :sigla => "AM", :RG => "21949724", :CPF => "46132162062"},
    {:nome => "Maria",  :sobrenome => "Ferreira",    :sigla => "PR", :RG => "28390894", :CPF => "72290383082"},
    {:nome => "Paulo",  :sobrenome => "Machado",     :sigla => "DF", :RG => "32307335", :CPF => "06128804004"},
    {:nome => "Pedro",  :sobrenome => "Bernardes",   :sigla => "SC", :RG => "50642457", :CPF => "02399026020"},
    {:nome => "Saulo",  :sobrenome => "dos Santos",  :sigla => "MT", :RG => "47668665", :CPF => "73465431065"},
    {:nome => "Jonas",  :sobrenome => "Albuquerque", :sigla => "MS", :RG => "18403836", :CPF => "47183654060"},
    {:nome => "Isabel", :sobrenome => "Costas",      :sigla => "SP", :RG => "49631312", :CPF => "96386442067"},
    {:nome => "Marcos", :sobrenome => "Moreira",     :sigla => "RJ", :RG => "44648031", :CPF => "85997815021"},
    {:nome => "Allan",  :sobrenome => "da Silva",    :sigla => "RN", :RG => "47715801", :CPF => "56960063027"},
    {:nome => "Alex",   :sobrenome => "dos Anjos",   :sigla => "RS", :RG => "45162419", :CPF => "54858889092"},
    {:nome => "Ramon",  :sobrenome => "Santino",     :sigla => "MG", :RG => "14326869", :CPF => "98534531005"},
    {:nome => "Rafael", :sobrenome => "Barbosa",     :sigla => "AC", :RG => "46503086", :CPF => "60211705047"},
    {:nome => "Dante",  :sobrenome => "Jacinto",     :sigla => "BA", :RG => "36431872", :CPF => "97874815033"}
]


lista_pessoas.each do |e|

    p = Pessoa.new()
    p.nome = e[:nome]
    p.sobrenome = e[:sobrenome]
    est = Estado.find_by_sigla(e[:sigla])
    p.estado_id = est.id;

    doc = Documento.new()
    doc.rg = e[:RG]
    doc.cpf = e[:CPF]
    doc.pessoa = p

    if p.invalid? || doc.invalid?
        puts "Registro Inválido:"
        p.errors[:nome].each do |s|
            puts "#{s}"
        end
        p.errors[:sobrenome].each do |s|
            puts "#{s}"
        end
        doc.errors[:rg].each do |s|
            puts "#{s}"
        end
        doc.errors[:cpf].each do |s|
            puts "#{s}"
        end
    else
        doc.save
    end
end

Futebol = Esporte.find_by_nome_esporte("Futebol")
Volei = Esporte.find_by_nome_esporte("Volei")
Tenis = Esporte.find_by_nome_esporte("Tênis")
Natacao = Esporte.find_by_nome_esporte("Natação")
PingPong = Esporte.find_by_nome_esporte("Ping Pong")
Musculacao = Esporte.find_by_nome_esporte("Musculação")

pessoa1 = Pessoa.find(1)
pessoa1.esportes << Futebol

pessoa2 = Pessoa.find(2)
pessoa2.esportes << Volei

pessoa3 = Pessoa.find(3)
pessoa3.esportes << Tenis

pessoa4 = Pessoa.find(4)
pessoa4.esportes << Natacao

pessoa5 = Pessoa.find(5)
pessoa5.esportes << PingPong

pessoa6 = Pessoa.find(6)
pessoa6.esportes << Musculacao

pessoa7 = Pessoa.find(7)
pessoa7.esportes << Futebol

pessoa8 = Pessoa.find(8)
pessoa8.esportes << Volei

pessoa9 = Pessoa.find(9)
pessoa9.esportes << Tenis

pessoa10 = Pessoa.find(10)
pessoa10.esportes << Natacao

pessoa11 = Pessoa.find(11)
pessoa11.esportes << PingPong

pessoa12 = Pessoa.find(12)
pessoa12.esportes << Musculacao

pessoa13 = Pessoa.find(13)
pessoa13.esportes << Futebol
