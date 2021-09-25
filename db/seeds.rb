# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: '@Mudar123', password_confirmation: '@Mudar123')

enquete1 = Enquete.create!(tipo: 'texto_livre', status: 'publicada', qtd_votos: 1, finaliza_em: 30.days.from_now,
  nome: 'Qual nome você quer dar ao nosso condomínio?', descricao: "Nesta etapa você vai sugerir um nome que posteriormente será votado por todos os cooperados. Caso queira deixe também uma justificativa para sua escolha."
)

enquete2 = Enquete.create!(tipo: 'texto_livre', status: 'publicada', qtd_votos: 1, finaliza_em: 30.days.from_now,
  nome: 'Qual a cor nosso condomínio deve ter?', descricao: "Nos ajude a escolher uma cor e deixe uma justificativa para os outros possam entender o motivo."
)

enquete3 = Enquete.create!(tipo: 'opcoes', status: 'publicada', qtd_votos: 1, finaliza_em: 30.days.from_now,
  nome: 'Nome você prefere?', descricao: "Nos ajude a escolher um nome."
)

Opcao.create!(enquete: enquete3, nome: 'Recanto dos Tucanos', descricao: 'Opção sugerida pelo colega Fulano de Tal, seque um texto sobre o nome.')
Opcao.create!(enquete: enquete3, nome: 'Recanto dos Cães', descricao: 'Opção sugerida pelo colega Fulano de Tal, seque um texto sobre o nome.')

dados = [{ nome: 'FULANO DA SILVA', documento: '07018254110'}]

dados.each do |d|
  next if Usuario.where(documento: d[:documento]).exists?
  Usuario.create!(nome: d[:nome], documento: d[:documento], tipo_documento: d[:documento].size == 11 ? 'cpf' : 'cnpj')
end