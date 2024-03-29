
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

#### 02/03/2024

@04-Mais contextos

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/php-bdd-projeto-aula3-completo.zip

@@02
Contextos diferentes

[00:00] Boas-vindas de volta a mais um capítulo desse treinamento de introdução a BDD utilizando PHP. E ainda nem chegamos na parte do BDD, explicando o que é, mas vamos chegar lá. Por enquanto eu quero dar uma organizada na nossa casa.
[00:15] Porque olha só, essa classe está complexa de ler, pelo menos para mim, até porque, como eu estou com a fonte bem grande para vocês conseguirem enxergar, eu estou me perdendo, eu não sei mais o que faz parte de cada teste etc. Então o que vamos fazer agora? Vamos começar a organizar um pouco. Existem algumas formas de organizar o seu projeto de testes com Behat e vamos começar a ver algumas delas.

[00:39] Primeiro eu quero separar os contextos de formação em memória e formação em SQL, porque temos claramente aqui um cenário onde estamos executando em memória, o Cadastro de formação com 1 palavra e um cenário onde estamos executando em SQL, o Cadastro de formação válida deve salvar no banco. Em um banco, com persistência, como você quiser chamar. Então eu vou criar classes separadas, classes diferentes. Então vamos lá! Eu vou criar uma nova classe.

[01:06] Repare que o Behat já configura essa pasta bootstrap como autoload sem nenhum namespace. É que utilizando uma PSR um pouco mais antiga, que é a PSR 0. Então podemos simplesmente criar uma classe sem namespace e eu vou chamá-la “FormacaoEmMemoria”.

[01:30] Todo contexto do Behat precisa implementar alguma interface de contexto, existem algumas, mas eu vou implementar \Behat\Behat\Context\Context que é a mais simples. Eu vou importar. Implementado esse contexto, eu consigo trazer aqueles métodos para cá, então eu vou trazer os métodos que realizam as verificações em memória. Vou trazer o @When, ou seja, Quando eu tentar criar uma formação e vou trazer o @Then, que por enquanto eu só tenho o eu vou ver a seguinte mensagem de erro :arg1.

[02:02] Então quando eu tento criar uma formação, vou importar a formação, eu vejo essa mensagem de erro. Só que eu não defini a mensagem de erro, então eu vou adicionar essa propriedade, que vai ser uma string, então private string $mensagemDeErro;. A princípio, tudo certo. O nosso contexto está pronto, já removi e agora esse contexto que se chamava FeatureContext só possui os detalhes de banco.

[02:29] Estou conectado no banco de dados, realizo a inserção no banco e verifico o banco de dados. Então separamos um pouco melhor. Vamos renomear para “FormacaoNoBanco”, acho que é um banco interessante. Vou salvar.

[02:45] Eu posso inclusive remover esse construtor que não estamos utilizando, posso remover essa mensagem de erro que não está sendo utilizada e agora eu tenho um pouco mais de organização. Então vamos executar os nossos testes para ver o que acontece. Então php vendor/bin/behat e quando eu executo.

[03:08] Apareceu um erro dizendo que não existe uma classe chamada FeatureContext. E o que isso quer dizer? Que estragamos a infraestrutura do Behat, acabamos com tudo que ele sabia. Porque o Behat parte do princípio que nessa pasta “bootstrap” vai ter uma classe chamada FeatureContext e para o informarmos que estamos utilizando classes diferentes, vamos precisar criar um arquivo bem simples chamado behat.yml.

[03:39] Então dentro dele vamos dizer que no perfil padrão, ou seja, default, vamos ter as suítes de testes e temos a suíte padrão também, a default e dentro dessa suíte padrão vamos definir quais são os contextos. E por enquanto temos os contextos FormacaoEmMemoria e FormacaoNoBanco. Temos esses dois contextos, vamos tentar executar de novo.

[04:07] E agora sim temos os nossos testes passando. E com isso ganhamos flexibilidade porque podemos criar novos cenários para o nosso contexto em memória, mas perdemos um pouco em agilidade. Quando quisermos criar um novo contexto, por exemplo, quando quisermos criar novos cenários que não façam parte de formação, vamos ter que ir no arquivo de configuração e definir esse novo contexto. Mas acho que é um trade off interessante, ganhamos mais do que perdemos.

[04:39] Então para vermos uma coisa interessante. Bom, primeiro quero mostrar que o PhpStorm já nos dá de brinde, ele identifica em qual dos dois contextos isso está. Em eu vou ver a seguinte mensagem de erro “Descrição precisa ter pelo menos 2 palavras” ele já identifica informação em memória e em tento salvar uma nova formação com a descrição “PHP na web” ele já identifica informação no banco.

[04:54] E vamos criar agora um novo cenário para verificação em memória. Verificamos o caso de erro em memória, vamos verificar o caso de sucesso em memória. Então criar um novo cenário com Criação de formação válida. No cenário que tínhamos eu vou trocar de Cadastro de formação com 1 palavras para Criação de formação com 1 palavra, que não estamos cadastrando, só estamos criando direto no código e não cadastrando no banco. Então Quando eu tentar criar uma formação com a descrição “PHP na web”.

[05:27] Repare que utilizamos o mesmo método que Quando eu tentar criar uma formação com a descrição “PHP” e isso vai fazer com que o Behat reutilize esse método. Então isso é bem interessante, eu consigo criar vários cenários com o mesmo caso, executando a mesma ação passando parâmetros diferentes. Então Quando eu tentar criar uma formação com a descrição “PHP na web” Então eu devo ter uma formação criada com a descrição “PHP na web”.

[06:00] E olha só que outra coisa que o PhpStorm faz de muito legal para nós, ele identificou que esse passo não existe, então teríamos que executar aquele comando do Behat ou pedir para ele atualizar ou ver o pedaço de código que ele pede para adicionar, copiar e colar, só que o PhpStorm já entrega de bandeja para nós com “Alt + Enter” e “Enter”. Ele vai criar para nós e eu posso definir em qual dos dois contextos FormacaoEmMemoria e FormacaoNoBanco. Vou criar no FormacaoEmMemoria e olha só.

[06:29] Ele já entrega para nós o método criado com o argumento necessário e a anotação definida @When. Então antes de qualquer coisa vamos implementar, garantindo que eu tenha uma formação com a descrição correta. Para eu verificar a descrição, já sabemos que vamos precisar armazenar essa formação em algum lugar. Adicionada a propriedade, vou definir a descrição da formação e vou garantir assert que essa formação tenha descrição igual ao argumento passado por parâmetro.

[07:02] E vou renomear o argumento com “Shift + F6” para descrição da formação, que vai ser uma string. Agora sim! Então eu tenho euDevoTerUmaFormaçãoCriadaComADescrição.

[07:20] Então conseguimos ver que já, aparentemente está tudo certo e repara que mais uma vez, para 2 cenários diferentes estamos utilizando o mesmo caso de @When, o mesmo método. Então ganhamos nesse ponto, além de separar melhor as nossas classes, temos uma reutilização de código em certo nível. Então vamos de novo executar nossos testes. php vendor/bin/behat.

[07:48] Temos os nossos testes passando. Só que eu sei que nem todo mundo utiliza PhpStorm, então como será que faríamos para pedir para o Behat automaticamente adicionar direto nesse arquivo correto, esse snippet de código, esse passo. E outra coisa, se você tiver reparado, o parâmetro para o @When está um pouco diferente do que vimos nos casos que foram gerados pelo Behat. Então vamos no próximo vídeo falar um pouco sobre essa geração de código pelo Behat.

@@03
Separação dos passos

Começamos a organizar um pouco nosso código para separar os códigos relacionados à manipulação de formações no banco e em memória em classes diferentes, conhecidas pelo Behat como Contextos.
Quais são as etapas para criar um novo contexto?

Selecione uma alternativa

Criar uma classe em features
Fazer com que essa classe implemente alguma interface de contexto do Behat
Adicionar esse novo contexto no arquivo behat.yml que fica na raiz do projeto
 
Alternativa correta
Criar uma classe em features/bootstrap
Fazer com que essa classe implemente a interface de contexto do Behat
Adicionar esse novo contexto no arquivo behat.yml que fica na raiz do projeto
 
Alternativa correta! Se quiser se aprofundar mais, pode dar uma olhada em https://docs.behat.org/en/latest/user_guide/context.html#context-class-requirements
Alternativa correta
Criar uma classe em features/bootstrap
Fazer com que essa classe estenda a classe de contexto do Behat
Adicionar esse novo contexto no arquivo behat.yml que fica na raiz do projeto
 
Alternativa errada! O behat fornece uma interface de contexto. Podemos implementá-la em nossas classes de contexto.

@@04
Gerando snippets

[00:00] Como eu comentei no último vídeo, repara que o PhpStorm gerou o parâmetro que passamos para a anotação @When de forma diferente do que o Behat tinha feito. E vamos dar uma revisada, porque eu acho que eu passei muito rápido nessa parte, talvez tenha ficado óbvio, mas talvez não. Então vamos dar uma revisada.
[00:24] Que o Behat, para ele saber quais métodos executar e quando executar, ele vai ler as anotações @When, @Then. Então sempre que eu tiver "quando" e o parâmetro que o Behat entende, ou seja, essa string, ele vai procurar algum método que tenha a anotação @When, que tenha como parâmetro dessa anotação um formato de string que se assemelhe a esse.

[00:46] Então nesse caso, temos exatamente a string mais um argumento que começa com dois pontos. Já o PhpStorm criou para nós esse argumento utilizando uma expressão regular. “Vinícius, tem algum problema fazer dessa forma?” Problema nenhum, longe disso! Funciona exatamente igual, só que eu acredito, e isso é uma opinião pessoal, eu acredito que seja mais fácil ler a anotação no formato do Behat, sem os detalhes de expressão regular. Então eu acredito que seja mais legível.

[01:21] Então como podemos fazer para gerar esse pedaço de código sem o PhpStorm? E outro detalhe que o PhpStorm faz é: ele cria os métodos com acentuação. Embora isso funcione no Php, não é a melhor prática, não é muito interessante. E principalmente no Windows, em alguns casos isso pode acabar dando problema. Então eu vou remover o método, só vou copiar o assert para não ter que reescrever isso tudo e vou remover esse método.

[01:50] Repara que aqui o PhpStorm já me diz que tem um problema, só que eu não vou mais usar o PhpStorm para gerar esse código, eu vou executar o php vendor/bin/behat e vou adicionar aquele --append-snippets com o --dry-run. Só que eu ainda posso informar mais um parâmetro, que é para qual contexto eu estou criando esses parâmetros. Então eu vou dizer -- snippets-forFormacaoEmMemoria. Então com isso vamos ver se eu não dei bobeira.

[02:27] Aparentemente eu fiz tudo certo. Ele pulou os cenários, ou seja, ele não rodou os testes, era o esperado, porque adicionamos aquele --dry-run e ele modificou o nosso arquivo FormacaoEmMemoria. Então eu vou sair e ver o nosso FormacaoEmMemoria.

[02:48] Temos lá o euDevoTerUmaFormacaoCriadaComADescricao e dessa vez sem acentuação no método e com aquele formato que já conhecemos. Então vamos nessa, adicionei o assert, vou colocar o nome do parâmetro certo (string $descricaoFormacao) é uma string e vamos executar os testes para garantir que tudo continua funcionando e eu não fiz nenhuma besteira. php vendor/bin/behat.

[03:16] Tudo continua passando e o nosso código continua funcionando, os nossos testes continuam passando.

[03:22] Então vamos recapitular. Conseguimos separar contextos diferentes para executar nossos testes. Na prática, se você conhece o PhpUnit, por exemplo, é a mesma coisa que criar classes diferentes para testes. Só que na prática muda um pouco, porque eu posso ter o mesmo arquivo de feature sendo executado em contextos diferentes. Então, por exemplo, esses dois cenários, Criação de formação com 1 palavra e Criação de formação válida estão sendo executados no FormacaoEmMemoria, porque é aonde o Behat encontrou essas definições dos passos necessários.

[03:57] Já o cenário Cadastro de formação válida deve salvar no banco o Behat só encontrou os passos necessários no contexto de FormacaoNoBanco. Então dessa forma conseguimos trabalhar, mesmo que seja em um arquivo só de feature com contextos diferentes. Agora imagina que eu quisesse rodar somente os testes que rodam em memória? Porque eu não tenho acesso ao banco de dados no momento ou eu não quero rodar no banco de dados, eu quero algo mais rápido. Como será que poderíamos filtrar as execuções?

[04:26] De novo, se você conhece PhpUnit, você sabe que temos as suítes de testes para conseguir organizar. Então como será que podemos organizar essa parte no Behat?

@@05
Conhecendo as tags

[00:00] O que vamos fazer agora é: além de ter a suíte padrão de testes, que executa tanto os testes, vamos dizer de unidade, os testes em memória, quanto os testes no banco que vamos chamar de testes de integração. Eu quero também criar suítes específicas para cada um desses.
[00:21] Sabemos que tem a suíte default, então vamos copiar e colar embaixo e colar embaixo de novo. A segunda eu vou chamar de unidade: e a terceira de integração:. Só que na suíte de unidade eu só quero utilizar o contexto em memória e na suíte integração somente o contexto no banco.

[00:50] Então com isso já temos 2 suítes. Então vamos tentar rodar os nossos testes de unidade. Vamos lá. php vendor/bin/behat para eu filtrar as suítes de teste, eu defino com s e vou chamar a suíte de unidade -s unidade. E repara o que vai acontecer.

[01:08] O meu contexto de unidade, que no caso é FormacaoEmMemoria. Assim, todos os contextos que eu tenho definidos na minha suíte de unidade, que no caso é um só, ele não possui a definição para os cenários Cadastro de formação válida deve salvar no banco. Então como que o Behat vai saber o que fazer? Ele não sabe que não deveria executar.

[01:28] Repare que um dos cenários não foi executado e o Behat me pergunta, “Onde você quer adicionar esse snippet?” Então eu vou falar para ele que eu não quero adicionar em lugar nenhum, porque, na verdade, o que eu quero é filtrar. Sempre que eu executar a suíte de unidade, eu só quero executar os cenários que estejam relacionados a testes de unidade, a testes em memória.

[01:56] Então eu quero de algum jeito informar que o cenário Criação de formação válida é da suíte de unidade, o de Criação de formação com 1 palavra também, já o Cadastro de formação válida deve salvar no banco é da suíte de testes de integração. Então e preciso informar para o Behat alguma forma para filtrar esses cenários e explicar que quando eu rodar a suíte de unidade, ele só pode rodar os dois primeiros cenários, ele nem pode tentar rodar o terceiro porque não tem contexto configurado.

[02:24] E podemos fazer isso através de tags. Por exemplo, eu posso adicionar filtros na minha suíte de unidades, esses filtros podem ser por tags ou por papéis. É muito mais comum filtro por tags e eu posso adicionar, por exemplo, a tag unidade. Eu poderia colocar qualquer coisa, mas vou dar o mesmo nome que a suíte, só para manter um padrão. Então vou fazer a mesma coisa em integração, onde eu adiciono um filtro, um filtro de tags vai ser pela tag integracao, que vai ser o mesmo nome da suíte.

[02:58] Agora sempre que eu executar a suíte unidade. Ele não vai executar teste nenhum. Por quê? Porque não temos nenhum cenário definido para essa suíte, nenhum cenário definido com essa tag e para adicionar uma tag é muito simples, basta começar com arroba (@) e digitar o nome da tag. Então eu vou adicionar a tag @unidade nos cenários Criação de formação com 1 palavra e Criação de formação válida e vou adicionar a tag @integracao nesse outro cenário Cadastro de formação válida deve salvar no banco.

[03:36] Agora quando eu executar a minha suíte de unidade, ele vai executar esses dois cenários. Se eu executar a minha suíte de integração, ele vai executar somente o terceiro cenário.

[03:47] E repara que ele até demora um pouco mais para executar, porque precisa ir no banco de dados, então isso já é esperado. Então com isso já conseguimos uma organização bem maior dos nossos testes, dos nossos cenários, dos nossos contextos. O nosso arquivo já está começando a tomar uma cara, vamos dizer assim.

[04:07] Só que como eu falei anteriormente, o propósito do Behat é testar funcionalidades do seu sistema, é algo mais amplo. Então essa ferramenta específica, o Behat, não é tão interessante para realizar esse tipo de teste.

[04:23] Note que o nosso teste não está tão legível e tão amigável quanto ele ficava no PhpUnit. Você concorda comigo? Espero que você respondido se concorda ou não. Mas o ponto é, o Behat pode fazer algumas coisas a mais, além de simplesmente executar alguns métodos. Então no próximo capítulo vamos ver uma coisa bem interessante sobre o Behat, que é como que ele pode nos ajudar a controlar um navegador para executar testes nele.

@@06
Para saber mais: Organização

Neste capítulo nós aprendemos a organizar um pouco os nossos códigos de testes.
Embora a documentação do Behat não seja a melhor do mundo, existe um breve capítulo sobre a organização dos testes através de tags, então você pode usar como referência quando precisar se lembrar: https://docs.behat.org/en/latest/user_guide/organizing.html

https://docs.behat.org/en/latest/user_guide/organizing.html

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

@@08
O que aprendemos?

O que aprendemos nessa aula:
Aprendemos na prática o que é um Contexto do Behat;
Aprendemos a separar nossos testes em vários Contextos;
Conhecemos o arquivo behat.yml;
Vimos como organizar e filtrar nossos testes através de tags;

#### 03/03/2024

@04-Automação do navegador

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/04/php-bdd-projeto-aula4-completo.zip

@@02
Instalando o Mink

[00:00] Boas-vindas de volta a mais um capítulo desse treinamento de BDD utilizando PHP. Mas antes de falarmos de BDD realmente, quero bater mais um papo com vocês sobre a ferramenta Behat e algo que ela nos fornece, que são as extensões. Existem várias extensões para o Behat e uma das mais famosas é a MinkExtension.
[00:21] A MinkExtension é uma extensão que pelo nome, vocês devem imaginar, faz a ligação entre o Mink e o Behat. Então é uma extensão para o Mink. Mas o que é esse tal de Mink? Dando uma olhada na documentação da MinkExtension, temos um link para essa ferramenta, que é o Mink.

[00:41] E o Mink nada mais é do que uma ferramenta que emula ou controla um navegador para podermos acessar e testar aplicações web. Então isso é bem interessante. E o Mink faz isso através de drivers. O Mink fornece alguns drivers e eu vou comentar os mais famosos.

[00:59] Esse primeiro e que é o mais utilizado, normalmente já vem instalado por padrão, é o que eu acredito que se pronuncie Goutte. Mas esse primeiro simula um navegador, só que somente fazendo requisições HTTP. Então ele não abre um navegador, abre uma janela, nada do tipo, ele só faz as requisições HTTP e interage com HTML, dessa forma ganhamos em performance.

[01:24] O Selenium é uma ferramenta que controla navegadores realmente. Então abre uma janela do navegador, vai clicando e o Mink consegue se comunicar com o Selenium. Esse BrowserKit é uma ferramenta muito parecida com essa primeira, um pouco mais nova da Symfony, mas o propósito é o mesmo.

[01:41] Esse ChromeDriver, o propósito é o mesmo do Selenium nesse caso, que é controlar o navegador real, só que a forma que ele faz é diferente, ele acessa o seu navegador mesmo instalado na sua máquina diretamente, já o Selenium precisa de um servidor rodando, então é um pouco diferente.

[01:59] Mas na prática, quando rodamos na nossa máquina, só em uma máquina, o resultado é o mesmo, acontece a abertura de uma janela do navegador mesmo. Mas por enquanto vamos utilizar o Goutte. E para instalar a MinkExtension, precisamos ter o Behat instalado, e já temos, estamos o utilizando e ter o Mink instalado. Então para instalar o Mink, vamos utilizando o Composer e fazemos um require --dev behat/mink.

[02:26] Para instalar a extensão, rodamos o comando require --dev behat/mink-extension e para instalar algum daqueles drivers, utilizamos o comando específico para cada driver, o pacote específico. Então composer require dev e o pacote de cada um dos drivers que você for utilizar.

[02:41] Existem vários drivers e existe um problema na versão atual da MinkExtension, que eu já deixei resolvido para vocês no arquivo composer.json. Esse arquivo já tem as soluções, porque o que aconteceu? A versão atual da MinkExtension está com uma incompatibilidade com a versão atual do pacote Mink.

[03:08] Então já aconteceu uma atualização do MinkExtension para corrigir esse problema, porque tem um problema de compatibilidade entre o Mink e a MinkExtension com alguns pacotes novos do Symfony que eles utilizam.

[03:21] Esse problema já foi corrigido, então no composer.json eu só defini que estou utilizando as versões mais novas do Github diretamente. Então eu vou fornecer esse arquivo para vocês poderem instalar sem problema e quando você já estiver craque com o Behat e for utilizar isso nos seus projetos para realizar os testes, muito provavelmente essa correção já vai ter sido implementada na versão pronta do Mink e da MinkExtension, então você não vai precisar se preocupar com isso.

[03:55] Mas eu também vou deixar um link de onde eu encontrei essa solução para que você entenda o que eu acabei fazendo nesse arquivo.

[04:00] Bom, com isso definido, eu já tenho a MinkExtension, tudo isso instalado, o Mink, a MinkExtension e um driver, que é o driver que não vai abrir o navegador, então vamos ver como utilizamos, como fazemos na prática o uso da MinkExtension. Vamos lá! Primeiro passo é ativar a extensão no nosso behat.yml.

[04:22] Então vou copiar esse arquivo e vou no meu behat.yml e além das nossas suítes, eu tenho também as minhas extensões configuradas. Por enquanto só uma que se chama Behat/MinkExtension, esse é o nome da extensão e tem alguns parâmetros que podemos passar para ela. Um dos parâmetros é a URL base. Ou seja, caso eu tente acessar "/login", vai ser "/login" de qual site? Então conseguimos informar aqui.

[05:04] No nosso caso, como já sabemos é ‘http://localhost:8080’. Conseguimos definir mais de uma sessão, ou seja, eu posso ter uma sessão em que eu estou logado, uma outra sessão em que eu não esteja logado, esse tipo de coisa, mas eu vou utilizar uma só, vou utilizar a padrão e nessa sessão eu vou utilizar o driver que eu já comentei que não abre um navegador na prática.

[05:26] Configurei a minha máquina, configurei a extensão, a habilitei, agora o que eu vou fazer? Eu preciso dizer para o Behat que quando eu executar algum teste, ele vai utilizar os contextos que essa extensão me dá. E essa extensão me dá alguns contextos, o primeiro, o que tem acesso a sessão do Mink diretamente, então você consegue acessar o Mink já configurado.

[05:50] Essa segunda é bem mais interessante, porque além de te entregar o Mink, ou seja, o acesso a esses drivers de navegador, você já tem diversos passos definidos. Como temos os nossos passos, tenta criar uma formação, esse tipo de coisa, esses passos, nesse contexto já entrega vários passos definidos para nós.

[06:12] Então podemos criar uma classe de contexto, ou aquela FeatureContext mesmo e estender essa classe que a extensão nos dá ou configurar diretamente no arquivo esse contexto que é exatamente o que eu vou fazer.

[06:25] Então na nossa configuração eu vou criar uma nova suíte de testes. Já temos testes de unidade, temos teste de integração e eu vou criar uma nova suíte de testes e2e, ou seja, end to end, ou ponta a ponta. Um teste de ponta a ponta é aquele que faz o teste da sua aplicação como um todo, ou seja, o fluxo inteiro de uma funcionalidade de ponta a ponta.

[06:51] Ou seja, acessando uma URL, fazendo login caso seja necessário, preenchendo campo no formulário, clicando no botão, interagindo com a aplicação como se fosse realmente um usuário.

[07:02] Então nesse tipo de teste eu vou utilizar o contexto que a extensão do Mink me fornece. Eu, como já temos feito de praxe, vou adicionar um fitro e vou utilizar a tag chamada de e2e também. Então o que eu quero testar? Quero testar a funcionalidade de login.

[07:22] Então dado que eu estou na página de login, ou seja, "/login", quando preencho o campo e-mail, que eu sei que o nome dele é e-mail, com vinicius@alura.com.br e preencho o campo senha, porque o nome dele é senha, com 123456 e pressiono “Fazer login” logo abaixo, então eu estou na URL /listarcursos.

[07:54] Vamos ver se eu consigo criar esse arquivo somente dessa forma que eu descrevi. Então vamos criar essa feature e eu vou criar de forma mais resumida. login.feature. Eu não vou criá-la de forma completa, eu vou ter a #Language: pt de português, Funcionalidade: Login e a descrição da funcionalidade embaixo, que deveríamos preencher, mas aqui para ser mais breve eu vou deixar assim mesmo e eu vou ter um cenário, que é Realizar login.

[08:26] Para realizar login, Dado eu estou em “/login” e repare que eu não estou colocando “Dado que eu estou”, isso é porque a tradução não é perfeita, então é assim que o Mink vai entender. Dado eu estou em “/login” Quando preencho “email” com vinicius@alura.com.br E preencho “senha” com “123456” E pressiono “Fazer login” Então devo estar em “/listarcursos”. Vamos dar uma olhada para ver se eu acertei.

[09:15] E como eu sei se eu acertei? Primeiro, eu preciso dizer que esse cenário faz parte da suíte @e2e e eu vou tentar rodar a nossa suíte com php vendor/bin/behat -2 e2e e vamos ver se eu acertei.

[09:31] E eu errei só o primeiro passo, não é Dado eu estou é Dado estou. Vamos ver se agora tudo funciona.

[09:42] Vamos dar uma olhada, vemos um cenário falhando. O que aconteceu? Acho que eu encontrei o problema, ele provavelmente, como eu utilizo Docker, não está encontrando o nome localhost. Então eu vou tentar utilizando o IP local e vamos executar.

[10:02] Agora sim, finalmente. Apesar de todos os problemas e complicações, conseguimos executar um teste que acessa a nossa página diretamente. Então repara que se eu mudar a URL, eu estou realizando todas as verificações.

[10:18] Dado que eu estou na página "/login", quando eu preencho “email” com email válido, quando eu preencho “senha” com uma senha válida e pressiono “fazer login”, então eu devo estar nessa URL. Se eu errar a URL, se eu for redirecionado para uma URL diferente, o nosso teste vai falhar.

[10:33] Então o teste falhou, perfeito. Então conseguimos ter um teste automatizado que acessa a nossa aplicação rodando, acessa o nosso servidor e realiza ações. Ele realmente acessa essa URL, ele preenche o campo “email” com o valor "vinicius@alura.com.br", ele preenche os campos, ele pressiona o link fazer login, o botão fazer login e aí ele verifica que está na URL especificada. Então isso tudo já é fornecido pelo Mink por padrão.

[11:02] Veremos nos próximos vídeos o que mais conseguimos fazer utilizando Mink.

@@03
Para saber mais: Mink

No momento da gravação do vídeo existia (espero que já tenham corrigido no momento em que você estiver assistindo) um bug por causa de versões de componentes necessários.
Caso ao tentar instalar as ferramentas da forma sugerida pela documentação, você pode utilizar a mesma solução que eu.

Substitua o conteúdo do seu arquivo composer.json pelo seguinte e depois execute o comando composer install:

{
  "autoload": {
    "psr-4": {
        "Alura\\Armazenamento\\": "src/"
    }
  },
  "require": {
    "psr/http-message": "^1.0",
    "psr/http-server-handler": "^1.0",
    "nyholm/psr7": "^1.1",
    "nyholm/psr7-server": "^0.3.0",
    "doctrine/orm": "^2.6",
    "php-di/php-di": "^6.0"
  },
  "require-dev": {
    "behat/behat": "dev-master as 3.6",
    "behat/mink": "dev-symfony5 as 1.7.999",
    "behat/mink-extension": "dev-patch-4",
    "behat/mink-goutte-driver": "^1.2"
  },
  "repositories": [
    {
      "type": "vcs",
      "url": "https://github.com/japicoder/Behat"
    },
    {
      "type": "vcs",
      "url": "https://github.com/larzuk91/Symfony2Extension"
    },
    {
      "type": "vcs",
      "url": "https://github.com/ruudk/DoctrineDataFixturesExtension"
    },
    {
      "type": "vcs",
      "url": "https://github.com/DonCallisto/MinkExtension",
      "comment": "Waiting for https://github.com/Behat/MinkExtension/pull/355"
    },
    {
      "type": "vcs",
      "url": "https://github.com/ruudk/MinkBrowserKitDriver"
    },
    {
      "type": "vcs",
      "url": "https://github.com/breizh81/Mink"
    }
  ]
}COPIAR CÓDIGO
Essa solução eu encontrei nesse link, caso você queira saber mais: https://github.com/Behat/Behat/pull/1256

https://github.com/Behat/Behat/pull/1256

@@04
Conhecendo a API

[00:00] E agora já entendemos que através do Behat, utilizando a MinkExtension, podemos até controlar o navegador. Nós utilizamos o driver do Goutte para não precisar abrir uma janela de navegador, até porque em um servidor normalmente não temos um navegador real instalado. E ele é bem simples, bem rápido, bem leve, mas você pode testar alguns outros drivers que estão na documentação caso queira.
[00:32] Acho que vale citar que apesar dos nossos testes estarem passando hoje, php vendor/bin/behat -s e2e.

[00:48] Então apesar de nossos testes estarem passando, caso eu venha na nossa view, na parte de login e modifique, por exemplo, um botão. Ao invés de fazer login eu o mudo para Logar, a partir de agora nossos testes não vão mais passar, porque ele não vai encontrar esse botão para clicar. Então repara como essa extensão funciona.

[01:11] Quando eu digo que pressiono o “Fazer Login” ou que eu preencho a senha, ele vai procurar um elemento com ID, com nome, com título, com alguma outra propriedade chamada alt ou com o valor ou até mesmo com o texto que passamos por parâmetro com o valor dele, o texto mesmo, então ele procura um elemento onde um desses atributos seja o parâmetro que passamos e a partir disso ele age.

[01:36] Então o campo senha é encontrado porque o nome dele, o atributo name é senha. Então dessa forma a extensão funciona e fornece diversas funcionalidades para nós.

[01:48] Mas você provavelmente está se perguntando o que mais eu consigo fazer. E através de uma simples interface da linha de comando, conseguimos ver diversas possibilidades para implementarmos testes. Então utilizando Behat php vendo/bin/behat, eu posso passar o parâmetro -dl e informar a linguagem que é português, -dl --lang=pt e com isso ele vai me informar todos os passos possíveis que eu tenho acesso.

[02:15] Então repara que temos os passos da test suit padrão, da test suit unidade, integração e da e2e. E repara que na de unidade e integração são os passos que nós criamos durante o treinamento e na e2e são os passos fornecidos pela MinkExtension.

[02:35] Então você pode ver que dado ou dados, estou na página de entrada, estou em e a página informada, quando eu voltei uma página, avancei uma página, pressiono o botão, sigo o link, preencho, marco algo, desmarco, anexo o arquivo, então tem muita possibilidade para desenvolvermos infinitos testes dessa forma. Então a MinkExtension nos fornece um controle muito interessante sobre navegadores, sobre controladores de navegadores.

[03:08] Mas caso você queria algo bem específico, que a MinkExtension não forneça para você, você obviamente pode fazer como fizemos nos nossos contexts. Você pode criar uma nova classe que estenda daquela Mink context, da classe Behat\MinkExtension\Context|MinkContext, você pode criar uma classe que a estenda e adicionar alguns passos caso você queira algumas coisas mais específicas. Não tem problema nenhum, não existe impedimento para você fazer isso.

[03:35] Mas basicamente essas são as funcionalidades que a MinkExtension nos fornece, ela já nos entrega de mão beijada. Só que comentamos um pouco sobre testes end to end, então antes de entrar na parte de BDD mesmo e explicar o que é BDD, eu quero falar bem rápido no próximo vídeo com vocês sobre alternativas para executar testes end to end para saber se realmente Behat é a única opção ou se existem outras técnicas, outras ferramentas e outros conceitos no estudo de testes end to end.

@@05
Behat e Mink

Vimos que o Behat se comunica de forma muito simples com o Mink (que controla navegadores) e a partir disso conseguimos realizar diversas ações e testes muito interessantes.
Como o Behat sabe que código executar para cada etapa definida de nossos testes E2E?

Os métodos referentes a cada etapa estão definidos na nossa classe de contexto E2E
 
Alternativa errada! Nós não implementamos esses métodos.
Alternativa correta
Os métodos referentes a cada etapa estão definidos na classe MinkContext
 
Alternativa correta! A classe MinkContext fornecida pela Mink Extension nos dá todas aquelas etapas já definidas como métodos que chamam funções do Mink. Não tem mágica nenhuma. ;-p
Alternativa correta
O Behat faz chamadas diretas ao sistema operacional, que por sua vez, controla o navegador
 
Alternativa errada! O Behat sozinho não faz nada disso.

@@06
Alternativas

[00:00] Vamos bater um papo bem rápido sobre testes end to end ou de ponta a ponta. Uma das ferramentas mais famosas, você provavelmente já ouviu falar, é a chamada Selenium. O Selenium é uma ferramenta que controla e automatiza navegadores, como ele próprio diz no site. Só que o Selenium fornece diversas ferramentas, existe o Selenium Grid, que é um servidor, onde você configura e pode ter um cluster de servidores que estão rodando o Google Chrome, por exemplo.
[00:33] Ele consegue controlar mais de um navegador, por exemplo, Internet Explorer, Firefox. Então o Selenium é uma ferramenta bem robusta com um propósito específico de automatizar interação com navegadores. E existem diversas ferramentas em PHP que conseguem acessar grids em servidores do Selenium.

[00:53] Então o Selenium é interessante, vale a pena dar uma lida e um dos principais componentes em PHP que fazem conexão com os navegadores e com o Selenium quando for necessário é o PHP-webdriver ou webdriver do PHP. Com essa biblioteca, com esse componente, que você pode dar uma lida na documentação, você consegue acessar um Grid Selenium, um servidor Selenium ou um navegador diretamente através de um webdriver.

[01:22] E hoje em dia, tanto o Firefox quanto o Chrome, fornecem uma API para esses programas, para esses componentes conseguirem se comunicar diretamente. Então é bem interessante, vale a pena dar uma lida.

[01:33] Além de controlar navegadores reais, como vimos com o Goutte, existe o Browser Kit. Como o nome já diz, é um kit de navegador, ou seja, uma ferramenta que simula o navegador de várias formas, permite que você acesse páginas, que você acesse conteúdos de sites e consiga interagir clicando, preenchendo formulários. A vantagem é que por não utilizar um navegador real, isso é muito mais rápido, ele realiza requisições HTTP e interage com o HTML sem precisar renderizar nada propriamente dito.

[02:10] A desvantagem é que a interação com o JavaScript não acontece utilizando esse tipo de pacote, então caso você esteja interagindo com um site, testando, automatizando a interação com um site que não faça uso de JavaScript fortemente, como um site que seja feito com uma SPA, com Angular, React, alguma coisa do tipo, então o BrowserKit pode ser uma boa para você realizar testes end to end.

[02:36] E para facilitar o acesso a tudo isso, existe o Panthor, que é uma ferramenta da Symfony também, que te permite utilizar Selenium, te permite utilizar diretamente o webdriver, o BrowserKit, permite que através de uma interface comum, você consiga utilizar diversas ferramentas para realizar esse tipo de trabalho.

[02:57] De forma bem parecida com o que o Mink faz, só que o Panthor é um pouco mais desacoplado e é mais atual, repara que o último commit na data que eu estou gravando, foi há 4 dias, ou seja, ele tem um desenvolvimento um pouco mais ativo.

[03:11] Então as chances de você esbarrar com um problema utilizando essa ferramenta é menor. Mas o propósito é bem semelhante ao do Mink, que utilizamos nesse treinamento. A vantagem do Mink é a integração já nativa com o Behat que é uma ferramenta bem interessante.

[03:27] E agora que batemos um papo sobre as ferramentas possíveis para realizar testes end to end vamos finalmente para o próximo capítulo e falar um pouco do que é o título desse treinamento, do que é BDD.

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

@@08
O que aprendemos?

O que aprendemos nessa aula:
Aprendemos o que é um teste E2E;
Conhecemos a ferramenta Mink e a Mink Extension;
Instalamos e configuramos a Mink Extension em nosso projeto;
Automatizamos testes que acessam nossa aplicação web;

#### 04/03/2024

@05-Testando antes

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/05/php-bdd-projeto-aula5-completo.zip

@@02
Testes Primeiro

[00:00] Boas-vindas a esse que é o último capítulo do nosso treinamento de BDD com Behat e antes de falar de técnicas, ferramentas ou qualquer coisa, chegou a hora de implementar uma funcionalidade de excluir a formação.
[00:14] Ela já está aqui no nosso template, já temos o botão, mas excluir que é bom, ainda não conseguimos. E da mesma forma como aprendemos nos cursos de testes que existe uma técnica chamada TDD, onde podemos antes de desenvolver a funcionalidade criar o teste para ela, vamos fazer agora, vamos utilizar do TDD. Criar primeiro o cenário de teste e depois vamos implementar.

[00:38] Então eu vou criar um novo arquivo chamado excluir-formacoes.feature. Então eu tenho como language o português, tenho como funcionalidade excluir formações. Eu, como instrutor Quero poder excluir uma formação e Para poder organizar minha lista de formações. Porque eu estou com um monte de formações que eu criei para teste e não quero mais elas. Então o que eu vou fazer? Eu preciso criar um cenário de teste.

[01:17] Então o cenário Excluir formação existente. Ou seja, nesse cenário eu sei que já existe uma formação cadastrada e eu vou apagar, qualquer uma. Então vamos nessa. Utilizando aquela sintaxe que o MinkExtension já nos fornece. Dado estou em “/login”. Vamos preparar o cenário mais completo. E preencho “email” com “vinicius@alura.com.br”, ou seja, esse vai ser um daqueles testes end to end. Eu vou criar todo o cenário, eu vou entrar na página, fazer login, depois que eu fizer login vou para a listagem de formações e lá na listagem vou clicar no botão excluir.

[02:15] E preencho “senha” com “123456” embaixo E pressiono “Fazer Login” agora eu vou estar naquela página inicial e embaixo coloco E pressiono ou navego para, alguma coisa do tipo E pressiono para “Formações”. Existe também o navego para, sigo o link, mas eu não me lembro exatamente. Vamos dar uma olhada, não custa nada, php vendor/bin/behat vamos ver como é exatamente. --lang=pt.

[02:53] Vamos testar algum outro, quero ver quando eu sigo o link. Sigo o link e o texto do link. Perfeito! Então é isso que eu quero. Embaixo de Eu pressiono coloco E sigo o link “Formações”. Então vamos lá. Dado que eu estou na tela de login e preencho email, senha, clico em “Fazer Login” e sigo o link “Formações”. Quando pressiono “Excluir” embaixo Então devo ver “Formação excluída com sucesso”.

[03:33] Então aqui já temos um cenário de teste, esse cenário vai ser da nossa suíte de e2e, ou seja, teste de ponta a ponta e vamos executar para ver se eu não digitei nada errado, se eu não dei mole em algum comando. Então php vendor/bin/behat na suíte de testes e2e.

[03:52] A princípio todos os cenários estão implementados, ótimo e um passo falhou. Vamos ver o que aconteceu, que esperamos que falhe mesmo.

[04:01] Quando pressiono “Excluir”. Aparentemente ele não encontrou nenhum botão excluir, então o que acontece? O “Excluir” também está como um link, então eu vou dizer que eu sigo o link “Excluir”. Quando sigo o link “Excluir”. E vamos ver se agora o erro vai ser diferente. Vamos nessa.

[04:27] Agora acho que temos um erro diferente. Perfeito! sigo o link “Excluir” então devo ver “Formação excluída com sucesso”. Só que dessa vez não recebemos nenhuma resposta, nenhum HTML, então temos um erro. Perfeito! O que fizemos? Criamos um cenário de teste, um cenário para verificarmos se uma funcionalidade está ok, só que essa funcionalidade não existe, então isso obviamente vai falhar.

[04:52] Só que agora, caso nosso cenário esteja criado corretamente, quando eu implementar essa funcionalidade já vamos ver esse teste passando. Então vamos ter a segurança que implementamos corretamente. Então essa é a magia de criar o teste antes de criarmos uma funcionalidade. Então no próximo vídeo vamos colocar a mão na massa e criar a funcionalidade, vamos tentar fazer esse teste finalmente passar.

@@03
Fazendo passar

[00:00] Vamos implementar juntos essa funcionalidade de excluir uma formação. Então já vou de cara criar essa nova rota em rotas.
[00:13] Excluir formação vai mandar para um novo controller que ainda não possuímos. Então vamos lá. Já vou definir o nome dele que vai ser ExclusaoDeFormacao. PhpStorm já nos fornece para gente uma chance de criar essa classe.

[00:34] E ótimo. Como eu sou cara de pau, vou pegar a implementação de exclusão de curso, que é bastante parecida e vamos nessa. Vou colocar em ExclusaoDeFormacao, vou importar isso tudo, só que ao invés de tentar pegar um curso, o que eu vou pegar? Vou pegar uma formação. Essa vai ser a diferença. E lembrando que se estamos copiando o código, significa que o código pode ser melhorado, mas eu não vou me preocupar com isso agora. Mas já fica para vocês saberem que algo de errado não está certo.

[01:16] Vou refatorar para ficar do jeito do PHP7.4. Vou trocar a variável de curso para $formacao = $this->entityManager. Vamos criar essa formação com o ID passado por parâmetro, vamos remover a entidade, mandar essa informação para o banco de dados e adicionar a mensagem “Formação excluída com sucesso”.

[01:43] Vamos ver se é isso que estamos esperando lá. Formação excluída com sucesso. Está certo. E vamos ser redirecionados para listar formações. Então a princípio nossa funcionalidade está implementada, vamos rodar o teste para ver se descobrimos se está tudo ok. Rodando o teste.

[02:04] Os dois testes passaram. Então repara que eu nem abri meu navegador, mas eu tenho certeza de que estou conseguindo excluir uma formação. “Vinícius, esse teste está perfeito?” Poxa, longe disso, eu estou excluindo aqui qualquer formação, eu estou excluindo a primeira formação da lista, só que no meu cenário, o cenário que eu estou definindo, para mim faz sentido isso, porque eu estou partindo do princípio que já existe uma formação.

[02:29] Só que em um cenário real e eu te convido a realizar esse desafio, você vai precisar realizar todos os passos de criar uma formação e só depois excluir essa formação específica. Então você provavelmente vai precisar seguir o link com a URL específica também.

[02:48] Mas então agora entendemos o processo de que primeiro criamos um teste, vemos esse teste falhar, agora eu realizei a implementação e verifiquei que o nosso caso está passando. Se eu entrar no meu projeto, eu tenho certeza e eu vou fazer isso só para garantir que eu confio em mim mesmo.

[03:07] Vou atualizar essa tela e excluir alguma formação. Eu garanto que isso vai funcionar. E está lá, “Formação excluída com sucesso”. Eu sei que funciona, porque o nosso teste já nos disse isso e eu automatizei esse processo. Então essa é a beleza de um teste de ponta a ponta. Eu garanto que independente do código estar ok, de estar tudo mais bonito, a aplicação em si está funcionando como eu espero.

[03:30] Então mais uma vez implementamos um teste de ponta a ponta, só que esse não é o foco do treinamento, no próximo vídeo finalmente vamos bater um papo sobre BDD.

@@04
Behavior Driven Development

[00:00] Boas-vindas ao final desse treinamento de BDD. E no último vídeo do treinamento finalmente vamos falar sobre o que é esse tal de BDD. E como eu sou muito cara de pau, eu venho direto trazendo para vocês uma página da Wikipedia para vocês saberem o que é BDD.
[00:15] Então vamos falar um pouco sobre o que é BDD. Na prática BDD é um processo ágil, um processo de desenvolvimento ágil, que incentiva a comunicação e a colaboração entre desenvolvedores, pessoas não-técnicas de negócio, participantes como o cliente, até pessoas específicas de teste.

[00:45] Então dessa forma, com essa comunicação mais próxima utilizando BDD, chegamos a definição do que precisa ser feito e a partir dessa definição feita, com todas as pessoas necessárias envolvidas, as pessoas de negócio, as pessoas que vão desenvolver, as pessoas que vão testar, com todos os envolvidos participando da decisão do que vai ser implementado e criando os cenários que serão verificados, aí sim partimos para realmente desenvolver aquela funcionalidade.

[01:15] Isso é fortemente incentivado, fortemente baseado no TDD, que é o test-driven development que já conversamos em treinamentos anteriores e a lógica é basicamente a mesma. Só que ao invés de criar um teste de uma funcionalidade específica, o Behavior-driven development preza que você desenvolva o cenário de teste completo antes de desenvolver a feature e não prestando atenção a detalhes.

[01:45] Então em excluir-formacoes.feature realizamos isso. Fizemos o login e clicamos em um botão. Clicando no botão sabíamos que tínhamos que ver uma mensagem de que a formação estava excluída com sucesso. E já deixo aqui um desafio, também não devo ver o nome da formação que você criou. Lembra que eu deixei um desafio para você criar a formação e depois excluir? Você tem que garantir que não a está vendo na tela também.

[02:10] Enfim, é a definição em alto nível da funcionalidade para depois você realizar esse teste. Isso quer dizer que BDD e TDD são coisas que vão andar separadas? Não, muito pelo contrário. Os dois podem andar juntos e comumente andam juntos.

[02:27] Se uma empresa tem a cultura de implementar o BDD, ou seja, se você recebe um arquivo parecido com criar-formacoes.feature, olha só, imagina se na sua empresa você recebesse um arquivo assim, ou você ajudasse a criar, obviamente, um arquivo desse tipo para saber o que vai desenvolver.

[02:42] Olha que maravilha. Criando um arquivo desse tipo, sabendo o que você vai desenvolver, você tem muito mais incentivos para praticar o TDD também. Você vai pegar um cenário de teste e conforme vai implementando, você vai precisar de classes novas, funcionalidades novas e você vai aplicar TDD nesses menores cenários e depois no cenário mais amplo, o BDD já foi aplicado, porque você já tem um cenário pronto para ser testado.

[03:08] Então a automatização de testes é onde o Behat, que é a ferramenta que utilizamos, entra. Só que o Behat não é uma ferramenta de BDD, é uma ferramenta de automação de processos. BDD é um princípio, é uma metodologia, vamos dizer assim, é um processo.

[03:25] Você quer aplicar BDD e você vai aplicando BDD junto com a equipe. Você não roda um comando e diz, “Estou aplicando BDD”. Você não cria um arquivo .feature e faz o Behat rodar um navegador bonito clicando nos botões e diz que implementa BDD. Não. Você segue o BDD quando as funcionalidades necessárias para o sistema guiam o seu desenvolvimento.

[03:49] Então essa é a lógica por trás do BDD. Então se você ver a página inicial de documentação do Behat.

[04:02] Se você vir a logo do Behat, é basicamente o símbolo do TDD, que já vimos sobre ele, que tem aquele ciclo, aquele fluxo onde escrevemos o código, escrevemos o teste, depois faz o teste passar, refatora. Escreve o teste, faz o teste passar, refatora. Só que isso tudo com um novo ciclo, que esse teste, esse ciclo de TDD fica dentro de um outro ciclo de BDD, onde definimos uma funcionalidade, definimos o que queremos e aí vamos implementar.

[04:33] Na implementação utilizamos TDD, até temos essa funcionalidade pronta, depois da funcionalidade pronta temos o teste passando, então podemos até refatorar mais, caso algo não tenha sido melhorado já utilizando o TDD. Então ambos se completam, ambos se complementam. BDD e TDD andam juntos e eu sei que essa sigla BDD, TDD, existe também DDD, existe um monte de coisa, fica até difícil de falar, mas o conceito por trás é basicamente o mesmo.

[05:03] Antes de desenvolver algo, você precisa garantir que sabe o que está desenvolvendo e como testar aquilo que você está desenvolvendo. BDD é possível até mesmo sem automação. Você pode ter o arquivo criar-formacoes.feature ou um arquivo em um formato que você definir com a sua equipe e não automatizar esses testes, ter só uma equipe de testes manuais.

[05:24] Isso vai ser muito caro, vai ser um processo muito mais trabalhoso, mas não deixa um processo de Behavior-driven development. Você vai ter o comportamento necessário antes de desenvolver. Só que a automação obviamente tem um papel enorme no BDD.

[05:40] Durante esse treinamento, principalmente no início, onde quase não colocamos a mão em código, na prática vimos bastante o que é um BDD, que é descrever as funcionalidades, encontrar as regras que essas funcionalidades precisam seguir, encontrar cenários para testar essas funcionalidades e a partir desses cenários desenvolver e garantir que tudo está ok.

[06:04] Então esse é o conceito por trás do BDD e isso é o Behavior-driven development.

@@05
Finalmente o BDD

Levamos o curso todo falando sobre testes, ferramentas (como Behat e Mink) e implementando código, mas sobre BDD mesmo, só falamos nesse último vídeo, né!?
O que, na prática, é o BDD?

É descrever uma funcionalidade que automatiza um teste antes mesmo de desenvolver a funcionalidade
 
Alternativa errada! Automatizar um teste não é BDD. Automação é só uma pequena parte.
Alternativa correta
É aplicar o TDD com testes E2E e testes de integração
 
Alternativa correta
É unir as equipes técnicas e não técnicas para definir os comportamentos necessários no software, e a partir dessas definições, desenvolver
 
Alternativa correta! Essa pode ser uma definição simplória de BDD, e repare que testes nem faz parte dessa definição. Mas para garantir que o que você desenvolveu está de acordo com a funcionalidade descrita, nós testamos. Então esse treinamento focou bastante na parte de automatização dos testes e definição de funcionalidades, mas as boas práticas para testar você já viu em outros treinamentos aqui na Alura. ;-)

@@06
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com os próximos cursos que tenham este como pré-requisito.

@@07
Projeto do curso

Caso queira, você pode baixar aqui o projeto completo implementado neste curso.

https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/06/php-bdd-projeto-aula6-completo.zip

@@08
O que aprendemos?

O que aprendemos nessa aula:
Reforçamos a ideia do TDD ao criar um cenário de testes antes mesmo de implementar a funcionalidade;
Entendemos, finalmente, o que realmente é BDD;
Vimos que BDD é uma metodologia, e não o simples processo de automatizar testes.

@@09
Conclusão

[00:00] Parabéns por terem chegado até o final desse treinamento. Esse treinamento onde entendemos um pouco sobre testes end to end, sobre testes em si e no final sobre o BDD (Behavior-driven development). Nesse treinamento vimos bastante coisa legal e começamos de forma bem simples descrevendo uma funcionalidade, depois de descrever encontramos regras e bolamos cenários para executar, para testar depois de pronta essa funcionalidade para garantir que está tudo ok.
[00:29] E a partir desses cenários, vimos que utilizando uma ferramenta chamada Behat conseguiríamos criar testes e nesses testes criamos e depois, inclusive, separamos eles em contextos diferentes, onde temos formações em memória e formações no banco para separar os nossos contextos do que é um teste mais próximo ao teste de unidade, o que é um teste mais próximo a um teste de integração.

[00:53] E vimos as dificuldades que testar com Behat nos entrega. Então vimos que o foco dele, o mais interessante do Behat e dessas ferramentas de BDD em geral de automatização de testes de funcionalidade são você poder executar testes end to end de forma muito simples.

[01:12] Repara que esse cenário de teste poderia muito bem ser escrito por uma pessoa que não faz a menor ideia de como se programa uma aplicação. Eu posso muito facilmente criar esse cenário sendo uma pessoa de negócios, que não sabe programar. Então isso facilita muito a parte de comunicação do BDD e falamos que essa parte de comunicação é crucial para o BDD, que é muito mais importante que qualquer tecnologia que usemos.

[01:37] As pessoas que cuidam do desenvolvimento precisam se comunicar com as pessoas que testam, com as pessoas do negócio, inclusive com o cliente. E essa comunicação leva a cenários mais assertivos para conseguirmos desenvolver uma nova funcionalidade que realmente agregue valor.

[01:54] Então espero que você tenha gostado desse treinamento, espero que tenha tirado proveito. Caso tenha ficado alguma dúvida, não hesite, pode abrir uma dúvida no fórum. Eu sempre tento responder pessoalmente, mas quando eu não consigo, a nossa comunidade de alunos e de monitores é bem solícita e alguém vai com certeza te ajuda. Mais uma vez parabéns por ter chegado até aqui, obrigado por ter me aturado até o final e espero te ver em outros cursos aqui na Alura.
