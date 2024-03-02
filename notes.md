
#### 29/02/2024

Curso de PHP e Behavior Driven Development: BDD com Behat

@01-Introdução ao BDD

[00:00] Boas-vindas à Alura, meu nome é Vinicius Dias, embora vocês ainda não estejam me vendo, eu vou guiar vocês nesse treinamento de BDD utilizando PHP para desenvolver as funcionalidades.
[00:12] Nesse treinamento vamos ver um pouco sobre documentação de funcionalidade, vamos falar sobre esse formato para documentarmos o que vamos desenvolver. Inclusive o documentário que vai desenvolver, obviamente antes de desenvolver. Porque depois que já estiver pronto, já sabemos que está funcionando. Então o ideal é que realizemos essas tarefas antes de chegar na parte do desenvolvimento.

[00:35] Então vamos ver como descrever uma funcionalidade e qual o propósito dessa funcionalidade, quem vai utilizar, quais regras essa funcionalidade precisa atender e vamos criar cenários de teste para isso. E esses cenários serão automatizados. Essa parte de automatização vai ser bem interessante e no final das contas vamos ter alguns testes rodado em memória e alguns outros testes rodando até em um banco de dados.

[00:59] Espero que você já tenha feito os treinamentos de teste de unidade de integração aqui na Alura utilizando PHP, então você já sabe a diferença entre esses dois testes. Só que você vai ver como implementá-los de uma forma diferente, utilizando outra ferramenta, com outra filosofia. E além de realizar testes que já conhecemos e sabemos como implementar, mas automatizando com uma linguagem bem interessante, também vamos aprender uma coisa nova sobre testes end-to-end ou testes de ponta a ponta.

[01:26] E nesse tipo de teste já vamos ver algumas ferramentas interessantes para que nem ao menos precisemos digitar código para realizar e automatizar esses testes. Algumas funcionalidades vão ser implementadas e vamos utilizar o projeto que utilizamos no curso de MVC, então vou disponibilizar para você baixar esse projeto e começarmos no mesmo ponto para começar a testar novas funcionalidades, documentar e falar bastante, porque nesse treinamento eu pretendo falar um bocado.

[01:54] Então vem comigo, espero que você aproveite bastante, tire bastante proveito. Caso durante o treinamento fique qualquer dúvida, não hesite, você pode abrir uma dúvida no fórum, eu tento responder pessoalmente, mas quando eu não consigo, nossa comunidade de alunos e de moderadores é bem solícita, então com certeza alguém vai poder te ajudar. Então vem comigo para o próximo vídeo para vermos qual é o sistema no qual vamos trabalhar e finalmente receber novas funcionalidades.

@@02
Projeto do curso

Faça download do projeto inicial aqui.
Com o projeto em mãos, extraia o arquivo e abra um terminal na pasta extraída. Siga as instruções:

Execute composer update para instalar todas as dependências necessárias
Crie o banco de dados executando o comando:
 php bin/doctrine orm:schema-tool:createCOPIAR CÓDIGO
Execute o seguinte comando para criar um usuário com e-mail “email@example.com” e senha “123456”
3.1 Em ambientes Unix (incluindo WSL e Git Bash no Windows):

php bin/doctrine dbal:run-sql "INSERT INTO usuarios (email, senha) VALUES ('email@example.com', '\$argon2i\$v=19\$m=65536,t=4,p=1\$WHpBb1FzTDVpTmQubU55bA\$jtZiWSSbmw1Ru4tYEq1SzShrMu0ap2PjblRQRubNPgo');"COPIAR CÓDIGO
3.2 Em ambientes Windows (PowerShell):

php bin/doctrine dbal:run-sql "INSERT INTO usuarios (email, senha) VALUES ('email@example.com', '`$argon2i`$v=19`$m=65536,t=4,p=1`$WHpBb1FzTDVpTmQubU55bA`$jtZiWSSbmw1Ru4tYEq1SzShrMu0ap2PjblRQRubNPgo');"COPIAR CÓDIGO
3.3 Em ambientes Windows (CMD):

 php bin/doctrine dbal:run-sql "INSERT INTO usuarios (email, senha) VALUES ('email@example.com', '$argon2i$v=19$m=65536,t=4,p=1$WHpBb1FzTDVpTmQubU55bA$jtZiWSSbmw1Ru4tYEq1SzShrMu0ap2PjblRQRubNPgo');"COPIAR CÓDIGO
Inicialize o projeto em um servidor web:
php -S 0.0.0.0:8080 -t publicCOPIAR CÓDIGO
Agora estamos prontos para continuar com o curso! :-D

https://github.com/CViniciusSDias/php-mvc/releases/tag/projeto-inicial-bdd

@@03
Apresentando o sistema

[00:00] E aí, pessoal? Vamos dar uma olhada bem rápida no sistema que vamos trabalhar antes de começarmos a trabalhar de fato. O sistema que vamos utilizar é o mesmo que construímos no curso de MVC aqui da Alura. Então, caso você já tenha feito esse treinamento, pode até pular essa etapa, porque você provavelmente já tem um ambiente configurado na sua máquina, mas caso contrário, fica aqui comigo para eu mostrar o sistema para você bem rápido.
[00:24] Eu já tenho o sistema todo configurado, então vou dar uma passada nele primeiro. Eu tenho um usuário cadastrado, coloco minha senha, vou fazer o login.

[00:34] E é um sistema de controle de cursos. Vamos cadastrar cursos, por exemplo. Então o que eu vou fazer? Vou cadastrar um novo curso, Introdução ao BDD, consigo cadastrar, consigo editar alguma coisa, consigo remover o curso e consigo fazer logout. Então tudo aparentemente funcionando e para você baixar, já que você precisa para dar continuidade nesse treinamento, eu vou deixar o link do repositório dele na atividade "Projeto do curso".

[01:05] O que você precisa é do PHP pelo menos na versão 7.3, pode ser na versão 7.4, que é a versão mais atual no momento que eu estou gravando, e é a que eu estou usando, ou pode ser até versões mais novas, como PHP 8, você provavelmente só vai precisar atualizar as dependências do Composer, mas tudo deve continuar funcionando.

[01:24] Você vai precisar do PHP no mínimo na versão 7.3, Composer instalado e o PDO SQLite, que já vem habilitado por padrão, então sem muito segredo. Caso você não queira instalar isso no computador, mas tem o Docker instalado, por exemplo, eu já deixei todos os comandos necessários, é só rodar esses comandos para o projeto estar configurado e você subir o servidor.

[01:44] De novo, caso você instale e não queira utilizar o Docker, caso você já tenha isso instalado na sua máquina, tanto PHP quanto Composer, basta executar os comandos sem toda a parte do Docker. Então, por exemplo, do Composer Install e o PHP para frente você já vai conseguir executar todos os comandos.

[02:03] Esses comandos são para configurar o banco de dados, gerar o esquema do banco de dados, inserir um novo usuário e levantar o servidor.

[02:11] O servidor é esse que estamos vendo, ele está rodando na linha de comando e você pode acompanhar tudo que está acontecendo.

[02:18] O código, você pode dar uma conferida nele, não é um código muito complexo, trabalhamos bastante em cima dele no treinamento de MVC. Então, caso você queira, é só dar uma olhada para conferir o que temos aqui.

[02:29] Então ambiente configurado com PHP instalado, Composer instalado, projeto configurado, você pode dar uma olhada, testar e garantir que tudo está funcionando, a partir de agora vamos começar a receber solicitações de novas funcionalidades. Então vamos para o próximo vídeo conversar sobre o que vamos ter que implementar nesse sistema.

@@04
Recebendo uma feature

[00:00] Como comentado no último vídeo, agora vamos começar a receber pedidos de novas funcionalidades. E é exatamente isso que aconteceu, eu tive uma reunião com o especialista de negócios, estivemos com a equipe inteira de negócios, na verdade, e começamos a discutir sobre a funcionalidade que precisamos implementar.
[00:21] Então eu gosto bastante de utilizar como rascunho, como editor de texto e não de código em si, o VS Code.

[00:30] Mas caso você queira continuar utilizando o PhpStorm para fazer seus rascunhos, problema nenhum, eu só vou utilizar por hábito, mas caso você queira, por exemplo, criar um arquivo só de rascunho, existe a funcionalidade “New > New Scratch File” e aí você pode criar um arquivo em texto para rascunho, mas eu vou abrir o VS Code e criar um novo arquivo para eu utilizar como rascunho. E eu vou anotar os detalhes da funcionalidade que estamos implementando.

[00:54] Vamos lá. É uma nova funcionalidade que é o cadastro de formações. Esse cadastro de formações, o que eu quero? O que eu quero atingir com esse cadastro de formações? Caso você já tenha estudado um pouco sobre metodologias ágeis, você provavelmente já ouviu falar sobre uma user story, que é uma forma de descrever uma funcionalidade, uma forma que você escreve uma história, o que você quer atingir de objetivo, o motivo de você implementar uma funcionalidade, para que você vá atacando e desenvolvendo pequenas histórias dessas.

[01:35] Então vamos, sem focar muito nos detalhes de user story, vamos criar uma. Eu vou dizer que eu, como instrutor, quero cadastrar formações para organizar meus cursos.

[01:53] Então esse é mais ou menos o formato de user story. Existem várias outras, outros formatos, só direto como instrutor, dizendo “eu quero”. Existem vários formatos, mas isso não importa, isso é um texto puro, nenhum programa vai ler isso nem nada do tipo, então só estamos organizando as ideias. Com isso, o que temos? Começamos a ter um arquivo, que tanto eu desenvolvedor, quanto uma pessoa da equipe de negócios consegue entender.

[02:22] Você concorda que qualquer pessoa que ler isso consegue entender o que tem que aplicar no sistema? Então com isso começamos a aproximar a comunicação com nossa equipe de negócios. Tanto eu desenvolvedor, quanto uma pessoa de negócios que ler esse arquivo, vai entender que essa requisição de uma nova funcionalidade, se trata do cadastro de formações e tem o propósito, tem quem vai utilizar essa funcionalidade(Eu, como instrutor), tem o que é a funcionalidade em si (Quero cadastrar informações) e tem o propósito (Para organizar meus cursos), tem o motivo de implementarmos essa funcionalidade.

[02:55] Eu sei que quem vai utilizá-la é um instrutor que estiver utilizando o sistema, eu sei que o que ele quer fazer é cadastrar formações no sistema e eu sei que ele quer fazer isso para poder organizar os cursos que ele já tem cadastrados. Então o que acontece? Com uma forma muito simples e um formato, digamos, bobo, conseguimos expressar bastante valor. E com essas user stories, essas histórias de usuário, com esses casos de uso, para quem já estudou UML, você poderia criar use cases, isso seria um caso de uso, um use case.

[03:32] Enfim, com esses detalhes, com essas descrições, conseguimos priorizar, saber qual funcionalidade vai agregar mais valor para os clientes, no caso para o instrutor que vai utilizar o sistema e saber o que priorizar, qual atacar primeiro, qual vamos desenvolver primeiro.

[03:46] E para ganhar uma mão na roda, ao invés de deixar isso como texto, eu vou informar que isso é um arquivo de funcionalidade.

[03:55] Então repara que ele já colocou uma cor bonita para mim, em Cadastro de Formações outra cor, mas de novo, caso você esteja no PhpStorm não tem problema, isso é só um arquivo de texto por enquanto, não estamos fazendo nada com ele, isso é só um rascunho. Se você estiver no Windows e quiser colocar isso no bloco de notas, perfeito. Se você quiser escrever na mão por enquanto, com papel e caneta, perfeito. Só estamos organizando ideias por enquanto e conversando com a equipe de negócios.

[04:22] Então nesse primeiro momento tudo que fizemos foi conversar com uma equipe de negócios para levantar uma ideia de funcionalidade. Os instrutores nos trouxeram essa demanda e nós, como desenvolvedores, junto com a equipe de negócios, estamos pensando em como implementar isso.

[04:38] Então a primeira coisa que precisamos fazer é descrever a funcionalidade do cadastro de formações. Então esse vídeo, embora tenha sido relativamente simples demais, serve para introduzir o conceito de user story e eu espero que você pesquise um pouco mais sobre o assunto, que é bem interessante e embora seja simples, pode te dar ideias bem legais de como organizar até mesmo seus projetos pessoais.

[04:59] Agora, sabemos que existe essa funcionalidade, sabemos que o instrutor quer cadastrar as formações para poder organizar os cursos. Mas quando eu for implementar isso, o que eu preciso verificar? Existe alguma regra específica, eu preciso informar algum detalhe a mais? Como por exemplo, eu poderia explicar que as regras são: A formação precisa ter uma descrição e a descrição precisa ter pelo menos 2 palavras.

[05:33] Posso realizar isso, posso organizar um pouco mais a nossa user story. Só que além de ter essas regras, eu preciso saber como que na hora do desenvolvimento e depois quando essa funcionalidade estiver pronta, como que eu vou testar e como eu vou garantir que essa funcionalidade está atingindo o que é esperado? A equipe de negócios vai realizar algumas verificações e eu quero deixar isso documentado, eu quero saber quais cenários eles vão utilizar.

[06:02] Por exemplo, caso eles cadastrem uma formação chamada PHP no meu sistema, o que eu espero que aconteça? Eu sei que segundo a regra, a descrição da formação precisa ter pelo menos 2 palavras, mas o que acontece com o meu sistema? O que eu espero que aconteça? E caso eu cadastre uma formação realmente correta com 2 palavras, como por exemplo, programação em PHP, PHP para backend, PHP na Web, algo assim, o que eu espero que aconteça? Eu vou ver uma mensagem? Eu vou ser redirecionado para alguma tela? Eu vou criar uma tela nova?

[06:38] Então precisamos descrever muito bem o que esperamos com essa funcionalidade que vamos implementar, cada um dos cenários. Vou encerrar esse vídeo por aqui, que já está ficando longo e no próximo vídeo vamos bater um papo bem rápido sobre os possíveis cenários dessa funcionalidade.

@@05
User Story

Neste vídeo nós utilizamos um formato muito conhecido para descrever uma funcionalidade. O nome desse formato é User Story .
Quais as vantagens de descrever uma funcionalidade utilizando uma User Story?

Além de identificar o que devemos fazer, sabemos qual tecnologia utilizar e quantos dias podemos tomar para refatorar
 
Alternativa correta
Além de identificar o que devemos fazer, sabemos o motivo pelo qual está sendo feito e por quem a funcionalidade será utilizada
 
Alternativa correta! Ao conhecer essas informações, podemos garantir que a funcionalidade realmente entrega o valor esperado. Se quiser saber mais sobre User Stories, vale a pena estudar sobre o assunto nos cursos de metodologias ágeis e Scrum aqui na Alura.
Alternativa correta
Com User Stories nós escrevemos pouco e não precisamos criar um documento formal de documentação

@@06
Definindo cenários

[00:00] Estamos aqui desenvolvendo a documentação de uma funcionalidade, ainda não colocamos a mão no código. Vamos dar uma passada bem rápida no que fizemos. Estamos descrevendo uma funcionalidade de cadastro de formações. Vimos um modelo, o formato de user story, para poder descrever uma feature, uma funcionalidade e até adicionamos algumas regras.
[00:23] Então "Como instrutor eu quero poder cadastrar algumas formações para poder organizar meus cursos". Essa é a funcionalidade. E para essa funcionalidade eu tenho as seguintes regras: Uma formação precisa ter uma descrição, é obrigatória a descrição e uma descrição precisa ter pelo menos 2 palavras, eu não posso cadastrar uma formação com o nome de PHP, por exemplo.

[00:44] Acho que é importante ressaltar que isso não é um formato específico que eu estou seguindo, isso é uma descrição de uma funcionalidade e eu estou sugerindo um formato, mas você pode escrever essa descrição como você quiser. Você pode, por exemplo, escrever: Preciso cadastrar formações com pelo menos 2 palavras.

[01:09] Se isso estiver claro para sua equipe, se dessa forma estiver claro o que é a funcionalidade, quais são as regras da funcionalidade, para que a funcionalidade está sendo implementada, se isso deixa claro, ótimo. Eu vou continuar seguindo com esse formato de user story e adicionando algumas regras a mais. Mas esse formato não é obrigatório, não estamos seguindo nenhum tipo de linguagem por enquanto.

[01:32] Vamos continuar e descrever alguns casos em que precisamos testar quando nossa funcionalidade estiver sendo desenvolvida. O que eu quero fazer aqui na prática é, vou pensar em um cenário, vamos até dar esse nome, cenário, onde eu tento fazer um cadastro de formação com 1 palavra. Como eu vou descrever esse cenário? Quando eu criar uma formação com apenas uma palavra, então eu preciso ver um erro. Foi isso que a minha equipe de negócios me disse, então vou escrever exatamente isso.

[02:06] Quando eu criar, ou quando eu crio, como você preferir escrever. Quando eu criar uma formação com apenas 1 palavra, então eu vou ver a seguinte mensagem de erro “Descrição precisa ter pelo menos 2 palavras”.

[02:40] Tenho um cenário, consigo ver de forma muito clara o que eu preciso testar. Eu sei que o cenário é quando eu realizo o cadastro de uma formação com uma palavra só, e eu descrevo que quando eu tentar criar uma formação com apenas uma palavra, então eu vou ver a seguinte mensagem de erro: “Descrição precisa ter pelo menos 2 palavras”. Parece um cenário bem claro.

[03:09] E repara que nesse cenário, o que descrevemos foi a ação e o resultado esperado. Perfeito. Isso já é facilmente compreensível para uma equipe de negócios. Uma equipe que entende do negócio, mas não entende da parte técnica, lê isso e fica tudo muito claro. Mas caso eu queira, eu também posso criar cenários mais específicos para equipe técnica, para equipe de TI.

[03:37] Então, por exemplo, eu posso criar um novo cenário: Cadastro de formação válida deve salvar no banco. Então eu posso além de definir a ação executada e o resultado esperado, eu posso definir uma pré-condição, um estado em que esse cenário precisa estar antes de eu executá-lo. Então vamos lá! Dado que estou conectado ao banco de dados, quando tento criar uma nova formação válida, então se eu buscar no banco, devo encontrar essa formação.

[04:26] Você pode escrever como preferir, pode escrever de forma mais bonita, mas basicamente eu acho que isso descreve bem nosso cenário.

[04:33] Repare que temos 2 cenários de testes e lendo esse documento já conseguimos imaginar o que precisamos desenvolver. E talvez você esteja pensando: “Caramba, Vinícius, eu vim fazer um curso de PHP, pelo amor de Deus, vamos ver código”, mas calma, já chegamos lá.

[04:51] Eu quero mostrar para vocês que é muito importante essa conversa com a equipe, tanto com a equipe técnica, para definirmos comportamentos mais detalhados da parte técnica, quanto com a equipe de negócios, para entendermos o que é esperado de uma funcionalidade.

[05:07] Então estamos documentando o que é necessário para implementar algo. Porque implementar, escrever código, é só uma parte do processo de entregar valor e nós, como desenvolvedores, queremos entregar valor, queremos entregar funcionalidade que agregue algo para o cliente, para o usuário.

[05:23] Tem um amigo meu, que inclusive tem um treinamento aqui na Alura de Web Scrapping, o Vitor Matos. Quando alguém pergunta para ele a profissão, ele não diz que é desenvolvedor, ele diz que é realizador de sonhos. E o que fazemos com tecnologia é isso, realizamos sonhos, entregamos para uma pessoa algo que ela imaginou que pudesse acontecer e fazemos acontecer.

[05:44] Escrever código é uma parte do nosso processo. Precisamos saber o que escrever antes de escrever. Então é exatamente isso que estamos fazendo por enquanto. Estamos documentando esse processo.

[05:55] E falando dessa documentação, no próximo capítulo vamos entender um pouco melhor sobre esse formato de arquivo que eu criei. Então te vejo no próximo capítulo.

@@07
Antes da implementação

Neste vídeo nós já descrevemos um cenário de testes antes mesmo de escrever qualquer tipo de implementação.
O que ganhamos ao, antes mesmo de desenvolver, sabermos o que precisamos testar?

Se sabemos o que precisamos testar, com certeza não teremos nenhum bug ou comportamento inesperado
 
Alternativa correta
Se escrevemos o cenário antes, podemos delegar a tarefa para outra pessoa e mesmo assim ganhar parte do crédito
 
Alternativa correta
Se sabemos o que precisamos testar, as chances são menores de nos esquecermos de algum detalhe.
 
Alternativa correta! Com o cenário de teste definido antes mesmo da implementação, podemos garantir que nossa funcionalidade, quando pronta, vai atender a todos os requisitos e assim garantimos que não nos esquecemos de nada.

@@08
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

@@09
O que aprendemos?

O que aprendemos nessa aula:
Aprendemos o que é uma User Story;
Definimos uma funcionalidade utilizando User Story;
Aprendemos a definir cenários de testes;
Entendemos a importância de definir cenários de testes para nossas funcionalidades;

#### 01/03/2024

@02-Conhecendo o Behat

@@01
Gherkin

[00:00] Boas-vindas de volta. Mais um capítulo desse treinamento de introdução ao BDD utilizando PHP. E antes de partirmos para código, escrevemos uma documentação bem interessante e se você reparar, eu estou utilizando um editor de código, que eu, Vinícius, utilizo para rascunho, mas caso você queira utilizar para programar também, sem problema. Mas eu gosto de usá-lo para rascunho e esse editor de código está me dando um highlight de sintaxe.
[00:29] E se ele está me dando um highlight de sintaxe em algumas palavras que eu coloco, significa que talvez essas palavras tenham algum valor, tenham algum significado. E dando uma olhada, pesquisando, vemos que essa “linguagem” que estamos utilizando, esse formato de arquivo é chamado de Gherkin.

[00:48] Esse formato de arquivo descreve exatamente como podemos criar um arquivo de funcionalidade, um arquivo que descreve uma funcionalidade.

[01:05] Dando uma olhada no formato, o que temos é exatamente o que fizemos. Nós temos uma funcionalidade e cenários para testar essa funcionalidade. E o cenário tem algo para realizarmos e o resultado esperado, o quando e então. Só que esse cenário também pode ter uma pré-condição, para isso usamos a palavra "dado", "dado que".

[01:28] Com isso conseguimos criar um arquivo que descreve a nossa funcionalidade, que documenta a nossa funcionalidade, só que eu estou escrevendo em português. E essa linguagem, esse formato de arquivo está me mostrando as palavras-chave em inglês.

[01:45] E tudo que falamos até agora, tudo que descrevemos até agora foi que estamos criando esse arquivo com a intenção de aproximar a nossa equipe de desenvolvimento, a equipe técnica, da equipe de negócios, a equipe que realmente entende do processo todo e não da tecnologia. Então se eu começar a escrever isso em inglês para atender aquela sintaxe, eu vou criar uma barreira muito grande para determinadas pessoas.

[02:12] Nem todo mundo sabe inglês na minha equipe, nem todo mundo conhece o idioma, então eu quero poder escrever em português.

[02:19] E se pesquisarmos Gherkin em português, encontramos diversos artigos, diversas documentações e uma delas é de uma ferramenta em PHP, que vamos falar um pouco mais sobre ela, mas que nessa ferramenta entendemos que colocando esse termo "#language: pt" em cima, já informamos para qualquer programa, para qualquer arquivo que for processar esse nosso arquivo de funcionalidade que estamos utilizando o idioma português.

[02:50] Então vamos fazer isso, vou colocar o #language: pt e pronto. Temos o que seria para nós desenvolvedores um comentário, mas para a equipe que é de negócios, eles vão ler isso, vão ignorar e continuar lendo tudo que está em português, tudo que eles conseguem ler de forma clara.

[03:08] Então com isso, com uma linha já informamos: “Olha, estou escrevendo isso em português e eu utilizo a nossa sintaxe do gherkin”.

[03:19] Dando mais uma olhada, repara que estamos seguindo exatamente o processo que é recomendado para construir esse modelo de domínio, como é chamado nessa página e eu vou deixar esse link na atividade "Para saber mais", para você ler com mais detalhes, mas basicamente o que temos é a documentação da funcionalidade. E nessa documentação da funcionalidade, olha como a descrição já foi feita em um outro modelo. Lembra que eu comentei que as users stories são feitas com formatos diferentes?

[03:48] Primeiro ele descreveu o propósito da funcionalidade, depois quem vai utilizar a funcionalidade e depois a funcionalidade em si. No nosso caso eu descrevi em uma ordem diferente. Primeiro o usuário, depois o propósito e depois a funcionalidade. Então existem vários formatos para descrever uma user story, como eu comentei e provavelmente você já pesquisou mais sobre, entre um vídeo e outro, mas basicamente descrevemos a nossa funcionalidade.

[04:14] E além de descrever, exatamente como fizemos, podemos criar algumas regras. Essas regras, mais uma vez, não precisam estar nesse formato de hífen antes, você pode escrever como quiser, porque essa parte é literalmente uma descrição, é para nós seres humanos lermos, é para batermos o olho e sabermos o que está acontecendo. Então entendendo o que está acontecendo, podemos criar os cenários de teste.

[04:41] Com os cenários de teste, com os cenários do que precisamos realizar, conseguimos definir pré-condições, conseguimos definir as ações e conseguimos definir o resultado esperado. E um detalhe que não implementamos ainda, é que podemos ter mais de uma pré-condição.

[05:00] Então por exemplo, dado que estou conectado ao banco de dados e esse banco de dados está em memória. Eu posso ter diversas pré-condições utilizando a palavra E. Também posso realizar mais de uma ação, quando tento criar uma formação válida e sua descrição é “PHP para web”. Eu tenho uma ação em duas etapas.

[05:28] Eu posso ter mais de um resultado esperado. Se eu buscar no banco devo encontrar essa formação e sua descrição deve estar correta. Eu posso definir mais etapas no meu processo, no meu cenário, então basta eu informar. Então eu espero algo e algo. É bem simples, é bem intuitivo esse formato. Então você pode dar uma lida em todo esse documento, que inclusive ele mostra como instalar a ferramenta que vai automatizar a leitura disso. É exatamente sobre essa ferramenta que vamos começar a conversar, vamos começar a dar uma olhada no próximo vídeo.

@@02
Para saber mais: Sintaxe de features

Vimos neste vídeo que a sintaxe que utilizamos tem um nome, e se chama Gherkin.
Essa sintaxe é bastante simples para tanto pessoas técnicas (da equipe de desenvolvimento) quanto pessoas não técnicas conseguirem entender e garantir que a funcionalidade está bem descrita.

Existem muito mais detalhes dessa sintaxe, e se você quiser se aprofundar, pode conferir nesse link aqui.

https://cucumber.io/docs/gherkin/

@@03
Behat

[00:00] Vamos começar a conversar sobre essa ferramenta chamada Behat. Antes de qualquer coisa, o que é o Behat? O Behat é uma ferramenta para testar de forma automática, obviamente, as suas expectativas do negócio. Essa é a descrição que ele coloca para nós.
[00:18] O que isso quer dizer? Significa que o Behat é uma ferramenta para automatizar isso que escrevemos anteriormente. Basicamente isso. O Behat vai ler esse arquivo, parcear e nos ajudar a automatizar os testes. Quer dizer que o Behat vai ler uma frase do documento e saber exatamente o que executar? Obviamente não. Mas ele vai nos dar uma boa ajuda para criar testes automatizados.

[00:43] No último vídeo eu mostrei para vocês uma documentação em português acessível neste link, só que se você der uma olhada, essa é uma tradução não-oficial, inclusive eu deixo o meu obrigado por essa tradução, para o Diego Santos. E quem tiver o interesse de ajudar, contribuir, isso é um projeto de código aberto, você pode tentar atualizar essa tradução. Mas como ele mesmo diz, essa tradução pode estar desatualizada, então eu vou seguir a documentação oficial do Behat, então dando uma olhada na documentação, chegamos na parte de instalação.

[01:13] Já conversamos um pouco sobre o arquivo, sobre o gherkin, sobre esse formato e já temos alguns cenários mais ou menos montados. Vamos modificá-los um pouco ainda, mas basicamente já temos quase tudo pronto. Então vamos começar a dar uma olhada na ferramenta em si, no Behat, que pode nos ajudar a configurar, a automatizar esses testes.

[01:38] Então antes de qualquer coisa vamos instalar o Behat, então eu vou copiar o comando require --dev behat/behat e no meu terminal, pode ser através do PhpStorm, do VS Code ou no terminal direto, vamos digitar composer require --dev behat/behat e instalar. Ele vai demorar um tempo, porque minha conexão não é das melhores, mas basicamente, depois que você instalar o Behat e ele estiver instalado, vamos começar a realizar algumas configurações.

[02:11] Primeiro, ele já vai dizer que você vai salvar aqueles arquivos de feature, aqueles arquivos de funcionalidade dentro de uma pasta features. Só que o Behat já cria algumas coisas para nós, então depois de instalado, vamos executar esse comando vendor/bin/behat --init. Só que eu vou pausar agora e vou voltar no próximo vídeo para executarmos essas configurações.

[02:31] Recapitulando, o que é o Behat? É uma ferramenta para automatizar testes de comportamento, ou seja, testes do nosso negócio. E esses testes podem ser totalmente relacionados ao negócio, podem ser relacionados à tecnologia que estamos utilizando, pode ser direto no navegador, podemos escrever o cenário que quisermos e vamos configurar o Behat para entender o que queremos que ele teste.

[02:59] Então o que vamos fazer neste capítulo no próximo vídeo é configurar o Behat, inicializá-lo para no próximo capítulo realizarmos alguns testes na prática. Então eu vou deixar instalando e no próximo vídeo eu volto com ele instalado para realizar essa configuração.

https://docbehat.readthedocs.io/pt/v3.1/

@@04
Propósito da ferramenta

Antes de colocarmos a mão na massa é importante garantirmos que todos os conceitos até aqui estão claros.
Qual o propósito Behat, segundo o que foi explicado no vídeo?

Automatizar testes de ponta a ponta (UI)
 
Alternativa errada! Nem só de testes de UI vivem testers. Brincadeiras a parte, o Behat pode ser utilizado para automatizar qualquer tipo de teste, não só de UI.
Alternativa correta
Automatizar testes de integração
 
Alternativa errada! Nem só de testes de integração vivem testers. Brincadeiras a parte, o Behat pode ser utilizado para automatizar qualquer tipo de teste, não só de integração.
Alternativa correta
Automatizar testes escritos utilizando Gherkin
 
Alternativa correta! Basicamente, Behat automatiza os cenários que nós definirmos utilizando a sintaxe Gherkin.

@@05
Inicializando as configurações

[00:00] Agora que eu já estou com o Behat instalado, podemos começar a brincar com ele, a ver o que ele fornece para nós. Só que no último vídeo eu me esqueci da parte mais importante, que é levar esse arquivo para o nosso projeto. Então eu vou copiar e no nosso projeto eu vou criar aquela pasta que o Behat já disse na documentação que é chamada de features.
[00:22] E aqui eu posso criar o arquivo com o nome que eu quiser, eu vou chamar de “formacoes.feature”. Eu poderia chamar de “criar-formacoes.feature”, vou chamar assim, acho que vai ficar melhor. Então eu tenho o nosso arquivo “criar-formacoes.feature” e quando eu colo.

[00:43] Repara que o PhpStorm, além de já reconhecer, colocar o ícone do gherkin, ele também reconhece as palavras, igual o Visual Studio Code estava fazendo. Então agora que já temos o arquivo, a pasta features e o nosso arquivo de feature configurado, vamos executar o comando para inicializar o Behat.

[01:01] Então vamos no terminal, eu já estou com o Behat instalado, então vendor/bin/behat --init. E olha só o que ele vai nos mostrar.

[01:10] Ele diz que criou a pasta bootstrap, onde vamos adicionar os nossos contextos, vamos falar mais sobre contextos um pouco mais para frente e ele também diz que já criou um contexto padrão para nós, o FeatureContext.

[01:25] Então eu vou minimizar isso e dar uma olhada na pasta. Mas antes, se você reparar que tem uma cor diferente, o PhpStorm já está me dizendo que o Behat não saberia executar esse teste, ele não sabe o que fazer quando eu tenho essas etapas para executar, então é interessante ver que o PhpStorm já se integra diretamente com o Behat por padrão.

[01:49] Bom, continuando. Em bootstrap eu tenho uma classe nova criada, que é um contexto, e de novo vamos falar mais sobre contextos, mas basicamente isso é o que vai ser executado quando rodarmos um teste.

[02:02] E como está dizendo nesse comentário, para cada um dos nossos cenários, uma nova instância desse contexto vai ser criada. Então temos um contexto criado, tem a nossa feature criada, o Behat teoricamente tem tudo que precisa para executar, mas se eu tentar executá-lo, se eu colocar vendor/bin/behat o que vai acontecer?

[02:26] Ele vai nos mostrar que identificou a nossa funcionalidade e identifico o nosso cenário e nesse nosso primeiro cenário, em amarelo ele mostra que tem 2 snippets, duas partes de código que ele não sabe o que fazer. E no nosso segundo cenário tem 3 partes, 3 passos, 3 passos que ele não sabe o que executar, ele não sabe como executar na prática. Então temos dois cenários e 5 passos, só que desses 5, os 5 estão indefinidos. Então o que ele consegue fazer?

[03:03] No nosso suite de testes padrão, para você que já fez os treinamentos de teste, sabe que conseguimos separar testes por suíte. Na nossa suíte padrão, que é a que estamos usando por enquanto, nós temos passos indefinidos, então o Behat pergunta para nós em qual contexto queremos gerar esses passos, esses pedaços de código. E por enquanto só temos um, então eu vou selecionar a opção 1, mas se você reparar no terminal o que eu teria que colar no nosso FeatureContext.

[03:35] Então ele não coloca para nós, ele não cria. Uma das coisas que podemos fazer é dando uma olhada na documentação, no help.

[03:43] Vemos que tem --append-snippets, ou seja, adiciona os snippets não definidos ainda lá no nosso contexto principal, no contexto que é o único que temos por enquanto. E além disso, existe a opção --dry-run, que só vai executar esse formatador, que no nosso caso vai adicionar o snippet lá, mas não vai tentar executar os testes, até porque, por enquanto não temos teste. Então vamos lá.

[04:17] Executar o --dry-run e --append-snippets. Deu certo, agora vou selecionar a FeatureContext 1 e perfeito, temos os snippets criados, os passos, as etapas adicionadas. Então eu vou fechar para vocês o que aconteceu.

[04:56] Para cada uma daquelas etapas, o Behat criou um método e cada um desses métodos vai literalmente ser executado quando ele chegar nessa etapa.

[05:06] E olha só que o PhpStorm já identificou que o método existe, inclusive eu consigo dar um “Ctrl + Click” e ir para o método. Só que se você reparar que existem algumas coisas interessantes e vamos focar no sintaxe highlight do PhpStorm.

[05:24] Nós temos tudo em preto, só uma string, nada além disso. Temos a palavra "quando", que é o que define que é uma etapa a seguir e temos a descrição dessa etapa. Só que o número "1" está azul, como se fosse um parâmetro. E o que está entre aspas também ficou como se fosse um parâmetro e isso vai ser recebido como um argumento.

[05:46] Então repara que como argumento receberíamos o número 1. A mensagem de erro receberíamos aquela string. Então isso é bem interessante que baseado no que escrevermos, podemos utilizar na nossa classe de testes. Então vamos modificar só um pouco para as coisas ficarem um pouco mais claras e mais explícitas. Então Quando eu tentar criar uma formação com a descrição “PHP” Então eu vou ver a seguinte mensagem de erro.

[06:18] Quando tento criar uma nova formação com a descrição “PHP na web”, que isso sim é uma descrição válida, Então se eu buscar no banco vou encontrar essa formação.

[06:30] O que eu vou fazer? Eu vou no FeatureContext e apagar tudo que foi gerado automaticamente para nós, para o Behat gerar de novo e agora com a feature correta. Então eu vou executar mais uma vez aquele comando para fazer o --append-snippets, vai adicionar no FeatureContext e pronto, vou fechar.

[06:48] E agora sim, quando eu tento criar uma formação com a descrição que eu receber por parâmetro, eu vou ter a seguinte mensagem de erro, a mensagem que eu recebi por parâmetro. Então nós temos a pré-condição do cenário, temos o passo a ser executado, temos tudo definido, só que obviamente falta uma parte, a implementação em si.

[07:11] Ainda não temos nada para executar, não temos essa funcionalidade para executar, então nosso teste obviamente não vai passar. Se eu executar isso, ele nem vai saber o que fazer. Vou executar só o vendor/bin/behat e vamos ver a saída que ele nos entrega.

[07:26] Olha só, nós temos 2 cenários pendentes para implementar, porque existe no FeatureContext essa PendingException. Ou seja, o Behat ainda não sabe o que fazer porque ainda não temos o código de produção. Então vamos lá, eu vou propor para você um desafio, eu quero que você implemente uma funcionalidade de criar uma formação.

[07:50] Caso você já tenha feito o curso de MVC, você vai tirar de letra, mas caso não tenha feito ainda, dá uma olhada no nosso Controller na lateral esquerda, de persistência de curso. Então conseguimos criar um curso da mesma forma precisamos ser capazes de criar uma formação.

[08:07] Vou encerrar esse vídeo por aqui, foi um vídeo um pouco mais denso, porque finalmente colocamos um pouco da prática, faz os exercícios desse capítulo e cria a persistência de uma formação e aí você pode criar a página na web com um formulário etc. Obviamente, eu vou te entregar essa funcionalidade pronta no próximo vídeo, mas eu deixo de desafio para você se aventurar um pouco e praticar.

@@06
Para saber mais: Desafio

Para desenvolver a implementação do cadastro de formações você pode conferir todos os arquivos do cadastro de Cursos. Lá você vai entender como tudo é feito.
Como nós vamos salvar formações, vamos precisar atualizar o banco de dados para ter uma tabela de formações. Após criar a entidade Formacao, você pode executar o seguinte comando para atualizar o banco de dados:

php vendor/bin/doctrine orm:schema-tool:update -f

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

@@08
O que aprendemos?

O que aprendemos nessa aula:
Vimos que a sintaxe que utilizamos para definir funcionalidades e cenários se chama Gherkin;
Aprendemos que o Behat automatiza testes escritos com Gherkin;
Inicializamos as configurações para começar a automatizar testes com Behat;

#### 02/03/2024

@03-Primeiro cenário

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/php-bdd-projeto-aula2-completo.zip

@@02
Conferindo a implementação

[00:00] Boas-vindas de volta a mais um capítulo desse treinamento de introdução ao BDD utilizando PHP. E como eu falei, eu já deixei o arquivo para você baixar, com todas as implementações que eu fiz entre um vídeo e outro, mas eu vou dar uma passada rápida com elas, caso você já tenha feito e queira conferir se fez igual a mim ou pelo menos parecido.
[00:22] Eu tenho dois controllers inicialmente, um é para simplesmente exibir o formulário de uma formação, então eu crio uma nova formação, que já vamos chegar nessa classe, defino o título como cadastrar a informação e depois eu exibo esse template, eu pego o HTML desse template e exibo. Segredo nenhum nesse controller, esse foi o mais simples de implementar, visto que já utilizamos o HTML Trait, então ele é praticamente igual ao controller de formulário de inserção de um curso.

[00:55] Antes de qualquer coisa, eu criei as rotas de nova formação, salvar formação e lista de formações. Perfeito, temos as rotas.

[01:04] O próximo controller foi da lista de formações, então supondo que eu já tenho algumas formações cadastradas, eu pego no meu controller o repositório de formações, o Doctrine já me entrega isso de mão beijada, não preciso criar nada e nesse repositório que eu estou buscando, eu consigo até realizar alguns filtros, está ordenado pela descrição, o título da página vai ser a listagem de formações e pronto.

[01:31] Com as formações em mãos e o título, eu pego o nosso template, que está dentro da pasta formações, que é o template listar e exibo.

[01:39] O de persistência que é o mais complexo, mas eu simplesmente copiei o código da persistência de curso. Em um projeto real faríamos uma refatoração para não duplicar código, mas como o código aqui em si não é o nosso foco, eu realmente copiei e colei na cara dura e só modifiquei de curso para formação. Tudo continua funcionando e caso o cadastro seja realizado com sucesso, somos redirecionados para a lista de formações.

[02:05] A classe formação em si é uma entidade anotada com as anotações do Doctrine, caso você já tenha feito o curso de Doctrine, você sabe o que isso tudo significa e o nosso ID pode ser nulo, eu posso criar na hora uma formação, a descrição começa com um texto vazio e isso, como já vimos em treinamentos, tem formas melhores de fazer, mas eu não estou focando no código de produção em si para podermos avançar.

[02:33] E quando eu for definir uma descrição, eu tenho a nossa regra que caso separando a nossa descrição por espaço, a contagem dessas palavras seja menor do que 2, então eu tenho o nosso erro de que a descrição precisa ter pelo menos 2 palavras. Então essa é uma regra de negócios que temos na formação como definimos no nosso arquivo de feature. Vou abri-lo.

[02:59] No nosso arquivo de feature nós temos a regra de que a descrição precisa ter pelo menos 2 palavras. Continuando nossa formação é só isso e temos o formulário onde eu insiro uma formação, eu só defino a descrição dela e salvo, simples assim.

[03:18] E a nossa página de listar, onde eu simplesmente exibo a descrição de todas as formações e deixei um botão para excluir, mas ainda não temos essa funcionalidade implementada. Além disso, só para deixar mais completo, eu coloquei um botão de formações, então eu defini as classes listar-cursos e listar-formacoes para estilizar e aí o nosso menu fica dessa forma.

[03:43] Então temos a funcionalidade de formações, tenho a listagem, consigo adicionar uma nova formação. Se eu colocar um título inválido, o erro não está nada amigável, então repara que isso teríamos que tratar.

[03:55] Mas eu estou recebendo o erro, como o esperado. Agora caso eu coloque PHP para Back end, ou seja, tenho mais de 2 palavras, quando eu salvar. Então aparentemente eu introduzi um bug, vamos lá corrigir esse bug. Persistência de formação.

[04:29] No nosso setDescricao vamos ver o que está chegando para nós na nossa descrição. Vamos ver. “PHP para back end”. Quando eu faço o explode disso utilizando um espaço, vamos ver o que temos. Temos um array. Interessante, bem interessante.

[04:53] Então eu inverti a ordem dos parâmetros e agora tudo deve funcionar. Atualizei.

[05:03] Então introduzi um bug, mas agora corrigido ao vivo. O que acontece? Em um processo real também teríamos testes para isso, como vamos implementar e para debugar não faríamos var.dump, utilizaríamos ex.thebug como já tem treinamentos aqui também.

[05:20] Mas como eu estou fazendo tudo correndo, só para chegarmos ao ponto desejado, está aí a funcionalidade implementada e agora sim funcionando e estamos prontos para escrever os testes para fazer com que os testes desses cenários possam realmente ser executados.

[05:37] Porque por enquanto eles não estão sendo executados, eles estão pendentes de implementação. Então é isso que vamos fazer nesse capítulo que é implementar os testes para esses dois cenários.

@@03
Arrange

[00:00] Baseado no nosso arquivo da descrição da feature, conseguimos verificar aquele cenário de erro, fomos no nosso projeto, tentamos criar uma nova formação com a descrição só PHP e viu o erro sendo exibido com a mensagem desejada. “A descrição precisa ter pelo menos 2 palavras”. Perfeito.
[00:22] E voltando, vimos também que o nosso cenário de sucesso, onde tentamos criar uma nova formação com a descrição PHP na web funcionou. Então PHP na web está aqui, se eu buscar no banco eu encontro essa formação. Só que eu quero automatizar esses testes e, por enquanto, o que eu vou automatizar? Eu não vou automatizar a abertura do navegador, clicar no botão, preencher no campo, salvar. Não! Eu vou automatizar a verificação direto no código.

[00:52] Então como já vimos em testes de unidade, por exemplo, podemos nos conectar com o banco de dados, tentar criar a formação e salvar e depois verifica se ela existe no banco. Podemos fazer exatamente isso. Então nesse vídeo vamos criar essa pré-condição, vamos criar esse passo onde temos uma conexão com o banco de dados. Então vamos nessa.

[01:19] Nós temos várias formas de fazer, mas o que eu vou fazer? Como o foco é o conceito do BDD, que vamos entrar bem mais em detalhes e um pouco da ferramenta que é o Behat, eu não vou focar nas boas práticas dos testes que já aprendemos em testes anteriores. Então o que eu vou fazer? Eu vou pegar o nosso container de dependência $container = require __DIR__. ‘/../../config/dependencias.php’;.

[01:55] Porque desse container eu consigo pegar um EntityManager. Por quê? Vou mostrar para vocês em “config > dependencias.php”.

[02:08] Sempre que eu tentar pegar um EntityManagerInterface, ele me entrega o EntityManagerCreator, só que o que eu acabei de ver que eu não me lembrava? Eu já configurei isso um pouco melhor e tenho uma classe específica para isso, então não vou precisar dessa gambiarra. Melhor ainda.

[02:25] Então ignora essa gambiarra que eu ia fazer, porque o projeto está um pouco mais organizado do que eu imaginei. Então já posso pegar o $entityManager e com isso, eu vou importar essa classe e já temos uma conexão com o banco de dados.

[02:40] Então já temos o EntityManager, só que eu vou armazená-lo aqui. Vou criar uma propriedade na classe private EntityManagerInterface vou chamar de $em. “Alt + Enter” e “Enter” para o PhpStorm importar. Então temos um EntityManager e eu vou inicializa-lo $this->em. Então o que acontece?

[03:10] Quando esse cenário for ser executado, o que o Behat vai fazer para nós? Ele vai dizer "Opa! Identifiquei um cenário!" Então vamos ver quais são os passos para executar esse cenário. Eu tenho uma pré-condição, dado que eu estou conectado ao banco de dados. Então quando ele ler essa instrução, ele vai no método queEstouConectadoAoBancoDeDados e vai executar esse código. E o que esse código faz? Esse código cria um EntityManager e armazena no EM, na propriedade EM, ou EntityManager, como você quiser chamar.

[03:45] Então eu simplesmente estou criando uma conexão utilizando o EntityManager. E lembra que isso tem até no documentário vem por padrão. Para cada cenário nós temos uma instância. Então esse cenário Cadastro de formação válida deve salvar no banco vai ser todo executado com a mesma instância.

[04:04] Então agora que eu inicializei o EntityManager, tanto a etapa Quando tento criar uma nova formação com a descrição “PHP na web” quanto a etapa Então se eu buscar no banco, devo encontrar essa formação vão ser executadas tendo acesso a esse EntityManager que acabamos de criar.

[04:16] Então com isso definido, vamos para a próxima etapa, que é Quando tento criar uma nova formação com a descrição “PHP na web”. Então no próximo vídeo vamos implementar isso.

@@04
Método do passo

Finalmente implementamos um passo do teste que foi definido no arquivo de feature.
Como o Behat sabe qual método tem que executar para cada passo?

Selecione uma alternativa

Baseado na anotação logo acima do método
 
Alternativa correta! Repare que os métodos possuem anotações como Given, When e Then. Essas anotações informam ao Behat que esses métodos devem ser executados quando um passo com uma descrição que bata com o parâmetro passado para essas anotações for encontrado. :-)
Alternativa correta
Baseado no nome do método
 
Alternativa correta
Baseado na ordem da definição dos métodos e dos passos no arquivo de feature

@@05
Act...

[00:00] No último vídeo executamos aquela etapa, que nos treinamentos de teste aprendemos como arrange, ou seja, definimos a pré-condição para executar o teste, preparamos o teste. Agora está na hora de executar a ação. Mas antes, vou deixar um aviso, também aprendemos nos treinamentos de teste como realizar testes com banco de dados.
[00:26] Então normalmente, o que eu teria seria uma nova conexão, por exemplo uma conexão com o banco de dados em memória, com um outro banco de dados específico para testes. No nosso caso eu vou utilizar o mesmo banco de dados só para termos alguma coisa lá, mas normalmente utilizaríamos um banco específico para testes.

[00:47] Com isso sendo citado, vamos para a parte do "Quando", ou seja, a ação em si. Em consigo, como são cenários relativamente curtos, como são etapas relativamente curtas, eu vou implementar a “Quando” e a “Então”. Então vamos lá. Quando eu tentar criar uma nova formação com a descrição “PHP na web”, como eu executo essa etapa? Então public function tentoCriarUmaNovaFormacaoComADescricao(string $descicaoformacao).

[01:15] Então o que eu vou fazer? Vou criar uma nova formação, a $formacao = new Formacao(); vou importar. Essa formação vai ter como descrição a descrição passada por parâmetro, então $formacao->setDescricao($descricaoFormacao);. Perfeito, só que eu ainda não a criei no banco de dados, eu não a salvei, então eu vou pegar do meu EntityManager, vou fazer um persist na formação e como nos lembramos bem, fazer um flush.

[01:47] Então agora eu criei no banco de dados a minha formação. Perfeito, essa etapa foi concluída. Isso foi o nosso act, ou seja, a nossa ação do teste, que é criar uma formação no banco de dados, exatamente isso que fizemos. Só que como essa etapa foi bem rápida, vamos criar também essa etapa para o nosso primeiro cenário. É quando eu tento criar uma formação com a descrição PHP. E nesse caso, lembra que comentamos no início, quando ainda estávamos criando os cenários?

[02:17] Esse cenário Cadastro da formação com 1 palavra não tem tanta relação com a tecnologia. Eu não quero saber se isso está indo para o banco de dados ou não, se está na web, eu só quero garantir que ao tentar criar uma formação com essa descrição, eu vou ter esse erro. Então pensando um pouco na implementação, eu posso dizer que quando eu tentar definir a descrição da formação, se o valor “PHP” for passado, então de cara eu vou receber o erro. Então nesse caso nem vamos precisar bater no banco de dados.

[02:48] Então vamos lá. No nosso método euTentarCriarUmaFormacaoComADescricao e de novo vamos ter a descrição da formação. Então vamos ter $formacao = new Formacao(); com a $formacao->setDescricao($descricaoFormacao):.

[03:10] Nós poderíamos, inclusive eu recomendo, definirmos nomes um pouco mais específicos. Então Quando eu tentar criar uma formação, perfeito, isso faz sentido. Agora no outro cenário, ao invés de Quando tento criar seria melhor Quando tento salvar uma nova formação acho que seria um pouco mais interessante. Então vamos modificar e aí você vai ver o processo de modificação de uma etapa. Então Quando tento salvar uma nova formação com a descrição “PHP na web, olha só o que acontece.

[03:44] O Behat não sabe mais que passo é esse, que etapa é essa. Então vamos encontrar isso onde já implementamos. Olha só, Quando tento salvar uma nova formação.

[03:56] Estão reparando? tento salvar uma nova formação ele já identificou. O nome do método não importa tanto, mas de qualquer forma vou alterar só para manter consistente.

[04:06] O que importa mesmo é o parâmetro @When tento salvar uma nova formação com a descrição :org1 que é passado para a anotação @When. Então a partir essa string o Behat sabe que ele precisa executar o método public function tentoSalvarUmaNovaFormacaoComADescricao(string $descricaoFormacao); e encontrar algum passo com essa descrição. Com isso tendo ficado claro, já implementamos a parte do Act, ou seja, eu estou tentando criar uma formação com uma descrição inválida, que é o “PHP” e tentando salvar uma formação com uma descrição válida.

[04:39] Temos os passos de execução do Act. Agora no próximo vídeo vamos criar esses dois asserts e aí entra uma peculiaridade, mas vamos conversar sobre isso no próximo vídeo.

@@06
Reescrevendo etapas

Neste vídeo nós reescrevemos uma etapa do cenário para que ela fique mais descritiva.
O que é necessário fazer após renomear uma etapa?

Alterar o parâmetro da anotação do método referente a essa etapa
 
Alternativa correta! O parâmetro da anotação é o que define qual método será executado, logo, precisamos alterá-lo.
Alternativa correta
Alterar o nome do método referente a essa etapa
 
Alternativa errada! O nome do método não importa
Alternativa correta
Alterar o parâmetro da anotação e o nome do método referente a essa etapa
 
Alternativa errada! O nome do método não importa

@@07
Assert

[00:00] Agora vamos para a última parte, que seria a parte do assert desses dois cenários e nessa parte vamos ver algumas peculiaridades. Para começar, vamos para o cenário Cadastro de formação com 1 palavra primeiro que vai ser mais complexo.
[00:15] Sempre que eu vou criar uma formação, eu preciso ver essa seguinte mensagem de erro. Só que o que acontece? Quando o Behat executar o método public function euTentarCriarUmaFormacaoComADescricao(string $descricaoFormacao):, uma exceção vai ser lançada.

[00:25] Então o programa já vai parar, essa execução do teste já vai parar e nunca vai ser executado esse método. Então como o Behat é uma ferramenta para testar comportamentos, vamos ter que fazer uma "gambiarra" para conseguirmos testar esse comportamento. E depois que eu implementar, vou discutir com vocês sobre isso.

[00:47] Criei a formação, vou fazer um try catch. Então vou fazer um try e pegar um \InvalidArgumentException.

[00:56] E pegando essa exceção, eu vou armazenar a mensagem de erro, que vai ser $exception->getMessage. Então o que eu estou fazendo? Estou executando esse código. Caso esse lance uma exceção, eu estou pegando essa exceção e salvando a mensagem na propriedade mensagem de erro.

[01:20] Inclusive eu vou inicializá-la com o string vazio. Agora, lá no meu assert $mensagemDeErro. Eu preciso garantir que return $MensagemDeErro === _$this->mensagemDeErro;. Só que essa simples comparação não vai fazer muita coisa, mas vamos lá, chegamos nessa próxima peculiaridade depois. Já temos uma parte implementada.

[01:52] Agora eu preciso garantir que se eu buscar no banco, devo encontrar essa formação, então vamos buscar no banco para encontrar essa formação.

[02:00] E como buscamos uma formação no banco? Pegando um repositório. $repositorio = $this->em->getRepository(Formacao::class);. Desse repositório eu quero buscar então $repositorio->findBy();.

[02:24] E agora eu preciso buscar pelo quê? Então entra um outro detalhe, eu não consigo de forma simples, existem técnicas um pouco mais complexas, que não vamos entrar aqui, mas eu não consigo de forma simples pegar informações do método $formacao->setDescricao($descricaoFormacao);, por exemplo, não consigo saber o ID, eu não consigo ter acesso a essa mesma descrição.

[02:47] Então uma possibilidade, seria da mesma forma que fizemos armazenando a mensagem de erro, armazenamos o ID da formação inserida. Então vamos lá! $this->idFormacaoInserida = $formacao->getId();. Então vamos criar isso, adicionar propriedade, isso deve ser o inteiro, caso seja qualquer coisa diferente de inteiro, deve dar erro. Nosso código deve falhar. Então eu posso buscar direto pelo ID. Um $this->idFormacaoInserida.

[03:25] Então pego a formação, vou informar para o PhpStorm que isso é uma formação e agora eu posso realizar alguma verificação, garantir que essa formação existe, garantir que essa informação é uma instância de formação, ou seja, que eu consegui buscar a informação com esse ID.

[03:44] Então temos aqui o passo a passo criado e vamos executar o teste para ver o que acontece. Se eu executar, olha só.

[03:53] Nossos testes passaram, só que se por exemplo, eu buscar a formação 1, ainda vamos continuar com o teste passando, quer dizer, caso exista uma formação com o ID 1. Existe sim. Então temos os dados passando, mas um outro detalhe, caso eu chegue e não faça nenhuma verificação. Eu venho aqui e não tem nenhuma verificação.

[04:26] Repara que meu Behat, meu teste, continua passando, então o que é a peculiaridade que eu estou tentando mostrar para vocês? O Behat é uma ferramenta para automatizar a execução de cenários, para testar, para realizar aqueles famosos asserts, ou seja, as verificações, precisamos de alguma biblioteca específica para realizar verificações.

[05:00] A própria documentação do Behat explica que o Behat em si não vem com nenhuma ferramenta de verificação e você pode e deve utilizar alguma nesse momento. Podemos utilizar o PhpUnit, por exemplo. Temos também funções do próprio PHP, funções de asserções. Então podemos garantir que a formação é uma instância de formação, ou seja, que essa nossa variável é uma instância de formação. Também podemos garantir que a mensagem de erro é igual a mensagem de erro.

[05:38] Essa função do PHP, que é uma função do próprio PHP, não é de nenhuma biblioteca externa, ela simplesmente verifica se algo é verdadeiro ou falso, se algo está correto. Então ele vai retornar falso em caso de erro e verdadeiro caso contrário. Só que isso continua não gerando o nosso resultado esperado. Eu vou executar o teste mais uma vez.

[06:05] Testes passando. Agora se eu tentar verificar, por exemplo, que formação é uma instância de curso, o nosso teste deveria falhar.

[06:15] Então, aparentemente, tudo funcionando. O que eu acreditei que ia acontecer? Que o assert não ia gerar nenhum erro nem nada do tipo. Só que o que o assert faz? E isso só recapitulando, não é do Behat, isso é uma função do próprio PHP. Quando um assert falha, ele gera um Warning e como ele gerou um Warning, o Behat sabe que falhou. Então eu vou fechar tudo e recapitular o que fizemos. Vamos lá!

[06:41] Nós temos a definição dos cenários, então eu sei que quando eu tentar criar uma formação com a descrição PHP, ele vai executar o código $formacao = new Formacao(); então eu tenho que ver a seguinte mensagem de erro. Então estou garantindo que a mensagem de erro é correta. No nosso outro cenário, dado que eu estou conectado no banco de dados, ele executa $this->em = (new EntityManagerCreator())->getEntityManager();.

[07:02] Quando tento salvar uma nova formação ele executa $formacao = new Formacao(); e se eu tento buscar no banco, devo encontrar, então ele executa /** @var \Doctrine\Persistence\ObjectRepository $repositorio.

[07:13] E aí o que acontece? Como o Behat sabe se seu teste passou ou falhou? Baseado na saída do comando. Se o comando saiu com algum erro, significa que o seu teste falhou. Se o comando deu algum problema, como por exemplo, um Warning gerado, uma exceção foi lançada, um erro aconteceu, então isso significa que seu teste falhou.

[07:33] Agora se nenhum problema acontecer, se não acontecer nenhum problema, nenhum warning gerado, nada do tipo, então ele vai identificar que seu teste passou, independente da verificação estar correta ou não. Por isso aquele nosso return não faria nada, ele não serve de nada.

[07:51] Então precisamos ou fazer o que a documentação recomenda, utilizar o PhpUnit para fazer aquele assert ou podemos utilizar a própria ferramenta do PHP, a própria função que o PHP fornece para nós, é uma saída.

[08:04] Vamos entender mais para frente em quais cenários é vantajoso utilizar o Behat, porque até agora nesses casos, você pode estar pensando que a simples utilização do PhpUnit para gerar esses testes é muito mais simples e a manutenção dos testes é muito mais fácil.

[08:21] E eu vou concordar com você nesse ponto, só que o Behat tem um propósito um pouco mais específico e vamos falar desse propósito ainda. Só que antes disso vamos continuar praticando sobre Behat, organização, sobre o que é BDD, só que todos esses assuntos, todos esses bate-papos virão nos próximos capítulos.

@@08
Para saber mais: Assert

Neste vídeo vimos uma particularidade interessante: Apesar de ser uma ferramenta de testes, o Behat não fornece nenhuma ferramenta para efetivamente verificar condições.
Para isso nós poderíamos utilizar o PHPUnit por exemplo que traz inúmeros métodos interessantes de verificação, mas como já há cursos de PHPUnit na plataforma, utilizamos algo novo: A função assert do PHP.

Essa função fornece um método muito simples que verifica se o parâmetro é verdadeiro, e caso contrário, emite um erro.

Para saber mais sobre essa função você pode conferir a documentação oficial: https://www.php.net/assert

@@09
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

@@10
O que aprendemos?

O que aprendemos nessa aula:
Aprendemos a efetivamente testar utilizando Behat;
Vimos que cada etapa do teste executa um método de uma classe de contexto do behat;
Conhecemos a função assert do PHP;