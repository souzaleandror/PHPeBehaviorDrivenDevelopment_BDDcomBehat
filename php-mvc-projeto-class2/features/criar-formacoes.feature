#language: pt
Funcionalidade: Casatro de formacoes
  Eu, como instrutor
  Quero cadastro formacoes
  Para organizar meus cursos

  Regras:
  - Formacao precisa ter uma descricao
  - Descricao precisa ter pelo menos 2 palavas

  Cenario: Cadastro de formacao com 1 palavra
    Quando eu tentar criar uma formacao com apenas 1 palavra "PHP"
    Entao eu vou ver a seguinte mensagem de erro "Descricao precisa ter pelo menos 2 palavras"

  Cenario: Cadastro de formacao valida deve salvar no banco
    Dado que estou conectado ao banco de dados
    Quando tento criar uma nova formacao "PHP na web"
    Entao se eu buscar no banco, devo encontrar essa formacao