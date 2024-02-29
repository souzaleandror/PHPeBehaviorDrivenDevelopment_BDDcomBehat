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