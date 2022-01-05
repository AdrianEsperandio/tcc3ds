class BookData {
  static const String tableLivros = "livros";
  static const String colIdLivro = "idLivro";
  static const String colQuantExemplares = "quantExemplares";
  static const String colCapaLivro = "capaLivro";
  static const String colTituloLivro = "tituloLivro";
  static const String colAutorLivro = "autorLivro";
  static const String colEditoraLivro = "editoraLivro";
  static const String colDescriLivro = "descriLivro";
  static const String colNumPaginas = "numPaginas";
  static const String colSituacaoLivro = "situacaoLivro";
  static const String colAnoLivro = "anoLivro";

  int? idLivro;
  String? quantExemplares;
  String? capaLivro;
  String? tituloLivro;
  String? autorLivro;
  String? editoraLivro;
  String? descriLivro;
  String? numPaginas;
  bool? situacaoLivro;
  String? anoLivro;

  BookData({
    this.idLivro,
    this.quantExemplares,
    this.capaLivro,
    this.tituloLivro,
    this.autorLivro,
    this.editoraLivro,
    this.descriLivro,
    this.numPaginas,
    this.situacaoLivro,
    this.anoLivro,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colIdLivro: idLivro,
      colQuantExemplares: quantExemplares,
      colCapaLivro: capaLivro,
      colTituloLivro: tituloLivro,
      colAutorLivro: autorLivro,
      colEditoraLivro: editoraLivro,
      colDescriLivro: descriLivro,
      colNumPaginas: numPaginas,
      colSituacaoLivro: situacaoLivro,
      colAnoLivro: anoLivro,
    };
    if (idLivro != null) map[colIdLivro] = idLivro;
    return map;
  }

  BookData.fromMap(Map<String, dynamic> map) {
    idLivro = map[colIdLivro];
    quantExemplares = map[colQuantExemplares];
    capaLivro = map[colCapaLivro];
    tituloLivro = map[colTituloLivro];
    autorLivro = map[colAutorLivro];
    editoraLivro = map[colEditoraLivro];
    descriLivro = map[colDescriLivro];
    numPaginas = map[colNumPaginas];
    situacaoLivro = map[colSituacaoLivro];
    anoLivro = map[colAnoLivro];
  }
}

final livrosHome = [
  BookData(
    idLivro: 1,
    quantExemplares: "89",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/618iHJVMh4L._SX342_SY445_QL70_ML2_.jpg",
    tituloLivro: "A revolução dos bichos",
    autorLivro: "George Orwell ",
    editoraLivro: "Companhia das Letras",
    descriLivro:
        "Verdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera numa tirania ainda mais opressiva que a dos humanos. Escrita em plena Segunda Guerra Mundial e publicada em 1945 depois de ter sido rejeitada por várias editoras, essa pequena narrativa causou desconforto ao satirizar ferozmente a ditadura stalinista numa época em que os soviéticos ainda eram aliados do Ocidente na luta contra o eixo nazifascista. De fato, são claras as referências: o despótico Napoleão seria Stálin, o banido Bola-de-Neve seria Trotsky, e os eventos políticos - expurgos, instituição de um estado policial, deturpação tendenciosa da História - mimetizam os que estavam em curso na União Soviética. Com o acirramento da Guerra Fria, as mesmas razões que causaram constrangimento na época de sua publicação levaram A revolução dos bichos a ser amplamente usada pelo Ocidente nas décadas seguintes como arma ideológica contra o comunismo. O próprio Orwell, adepto do socialismo e inimigo de qualquer forma de manipulação política, sentiu-se incomodado com a utilização de sua fábula como panfleto. Depois das profundas transformações políticas que mudaram a fisionomia do planeta nas últimas décadas, a pequena obra-prima de Orwell pode ser vista sem o viés ideológico reducionista. Mais de sessenta anos depois de escrita, ela mantém o viço e o brilho de uma alegoria perene sobre as fraquezas humanas que levam à corrosão dos grandes projetos de revolução política. É irônico que o escritor, para fazer esse retrato cruel da humanidade, tenha recorrido aos animais como personagens. De certo modo, a inteligência política que humaniza seus bichos é a mesma que animaliza os homens.",
    numPaginas: "157",
    situacaoLivro: false,
    anoLivro: "2007",
  ),
  BookData(
    idLivro: 2,
    quantExemplares: "20",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/81tI1EZQVoL.jpg",
    tituloLivro: "O castelo",
    autorLivro: "Franz Kafka",
    editoraLivro: "Companhia de Bolso",
    descriLivro:
        "Fausto do século XX, O castelo é considerado um dos pontos mais altos da ficção universal. Na história de K., o suposto agrimensor que tenta inutilmente chegar ao castelo que vê no topo de uma colina, o termo kafkiano parece atingir sua extensão completa. O agrimensor K. chega a uma aldeia coberta de neve e procura abrigo num albergue perto da ponte. O ambiente sombrio e a recepção ambígua dão o tom do que será o romance. No dia seguinte o herói vê, no pico da colina gelada, o castelo: como um aviso sinistro, bandos de gralhas circulam em torno da torre. O personagem, K., nunca conseguirá chegar até o alto, nem os donos do poder permitirão que o faça. Em vez disso, o suposto agrimensor - mesmo a esse respeito não há certeza - busca reivindicar seus direitos a um verdadeiro cortejo de burocratas maliciosos, que o atiram de um lado para outro com argumentos que desenham o labirinto intransponível em que se entrincheira a dominação. O castelo - Fausto do século XX consolidado como um dos pontos mais altos da ficção universal - mostra a extensão completa",
    numPaginas: "348",
    situacaoLivro: true,
    anoLivro: "2000",
  ),
  BookData(
    idLivro: 3,
    quantExemplares: "7",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/61hH5E8xHZL.jpg",
    tituloLivro: "O ladrão de raios (Percy Jackson e os Olimpianos)",
    autorLivro: "Rick Riordan",
    editoraLivro: "Intrínseca",
    descriLivro:
        "Primeiro volume da saga Percy Jackson e os olimpianos, O ladrão de raios esteve entre os primeiros lugares na lista das séries mais vendidas do The New York Times. O autor conjuga lendas da mitologia grega com aventuras no século XXI. Nelas, os deuses do Olimpo continuam vivos, ainda se apaixonam por mortais e geram filhos metade deuses, metade humanos, como os heróis da Grécia antiga. Marcados pelo destino, eles dificilmente passam da adolescência. Poucos conseguem descobrir sua identidade. O garoto-problema Percy Jackson é um deles. Tem experiências estranhas em que deuses e monstros mitológicos parecem saltar das páginas dos livros direto para a sua vida. Pior que isso: algumas dessas criaturas estão bastante irritadas. Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.",
    numPaginas: "350",
    situacaoLivro: true,
    anoLivro: "2012",
  ),
  BookData(
    idLivro: 4,
    quantExemplares: "89",
    capaLivro: "https://m.media-amazon.com/images/I/51S6-VeaHJL.jpg",
    tituloLivro: "O Hobbit ",
    autorLivro: "J.R.R. Tolkien",
    editoraLivro: "HarperCollins Brasil",
    descriLivro:
        "Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos. Essa jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, sejam eles, os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler e descobrir. Lançado em 1937, O Hobbit é um divisor de águas na literatura fantástica mundial.",
    numPaginas: "401",
    situacaoLivro: true,
    anoLivro: "2019",
  ),
  BookData(
    idLivro: 5,
    quantExemplares: "89",
    capaLivro:
        "https://lojasaraiva.vteximg.com.br/arquivos/ids/12710209/1010071147.jpg?v=637154380982930000",
    tituloLivro: "Pai Rico, Pai Pobre",
    autorLivro: " Robert T. Kiyosaki",
    editoraLivro: "Alta Books",
    descriLivro:
        "A escola prepara as crianças para o mundo real? Essa é a primeira pergunta com a qual o leitor se depara neste livro. O recado é ousado e direto: boa formação e notas altas não bastam para assegurar o sucesso de alguém. O mundo mudou; a maioria dos jovens tem cartão de crédito, antes mesmo de concluir os estudos, e nunca teve aula sobre dinheiro, investimentos, juros etc. Ou seja, eles vão para a escola, mas continuam financeiramente improficientes, despreparados para enfrentar um mundo que valoriza mais as despesas do que a poupança. Para o autor, o conselho mais perigoso que se pode dar a um jovem nos dias de hoje é: “Vá para a escola, tire notas altas e depoisprocure um trabalho seguro.” O fato é que agora as regras são outras, e não existe mais emprego garantido para ninguém. Pai Rico, Pai Pobre demonstra que a questão não é ser empregado ou empregador, mas ter o controle do próprio destino ou delegá-lo a alguém. É essa a tese de Robert Kiyosaki neste livro substancial e visionário. Para ele, a formação proporcionada pelo sistema educacional não prepara os jovens para o mundo que encontrarão depois de formados. E como os pais podem ensinar aos filhos o que a escola relega? Essa é outra das muitas perguntas que o leitor encontra em Pai Rico, Pai Pobre. Nesse sentido, a proposta do autor é facilitar a tarefa dos pais. Quem entende de contabilidade deve esquecer seus conhecimentos acadêmicos, pois muitas das teorias expostas por Robert Kiyosaki contrariam os princípios contábeis comumente aceitos, e apresentam uma valiosa e moderna percepção do modo como se realizam os investimentos. A sociedade sofre mudanças radicais e, talvez, de proporções maiores do que as ocorridas em séculos passados. Não existe bola de cristal, mas algo é certo: a perspectiva global de transformações transcende nossa realidade imediata. Aconteça o que acontecer, só existem duas alternativas: segurança ou independência financeira. E o objetivo de Pai Rico, Pai Pobre é instruir o leitor e despertar sua inteligência financeira e a de seus filhos. “A principal razão pela qual as pessoas têm problemas financeiros é que passaram anos na escola, mas não aprenderam nada sobre dinheiro. O resultado é que elas aprendem a trabalhar por dinheiro… mas nunca a fazê-lo trabalhar para elas.” — Robert Kiyosaki",
    numPaginas: "336",
    situacaoLivro: true,
    anoLivro: "2017",
  ),
  BookData(
    idLivro: 6,
    quantExemplares: "21",
    capaLivro:
        "https://lojasaraiva.vteximg.com.br/arquivos/ids/12103474/1007028516.jpg?v=637142226675970000",
    tituloLivro: "Extraordinário",
    autorLivro: "R.J.Palacio",
    editoraLivro: "Intrinseca",
    descriLivro:
        "“Extraordinário” é um livro que conquistou diversos públicos e foi adaptado para o cinema ainda em 2017! Aproveite para ler o livro e conhecer essa história inteligente, sensível e leve que traz mensagens sutis e humanas, deixando uma verdadeira lição de vida sobre respeito e amor ao próximo.“Toda pessoa deveria ser aplaudida de pé pelo menos uma vez na vida, porque todos nós vencemos o mundo” August Pullman (Extraordinário) Não julgue um menino pela cara Não existe nome mais adequado para este livro: “Extraordinário”. De leitura dinâmica, prazerosa e envolvente, “Extraordinário” conta a história de August Pullman, o Auggie, uma criança que nasceu com uma séria síndrome genética que o deixou com deformidades faciais, fazendo com que ele passasse por diversas cirurgias e complicações médicas ao longo dos seus poucos anos de vida. Auggie foi educado em casa até os 10 anos, quando começou a frequentar o quinto ano em uma escola de verdade. Ser o aluno novo não é fácil, mas com um rosto tão diferente pode ser ainda mais difícil! Auggie vai ter que convencer seus colegas do colégio particular de Nova York que, apesar de sua aparência diferente, ele é um menino igual a todos os outros.",
    numPaginas: "320",
    situacaoLivro: true,
    anoLivro: "2013",
  ),
];

final livrosRecomendados = [
  BookData(
    idLivro: 7,
    quantExemplares: "89",
    capaLivro: "https://m.media-amazon.com/images/I/51itrBxO7hL.jpg",
    tituloLivro: "Resident Evil 5 - Nêmesis",
    autorLivro: "S.D Perry",
    editoraLivro: "Benvirá",
    descriLivro:
        "Resident Evil 5 - Nêmesis é inspirado nos acontecimentos que levaram à destruição de Raccoon City pelo vírus T. A trama gira em torno de Jill Valentine, membro do S.T.A.R.S. que sobrevive ao incidente na mansão Spencer. Enquanto Jill tenta convencer a todos de que a corporação Umbrella esteve envolvida na morte de seus companheiros e na produção de armas bio-orgânicas, a cidade começa a ser tomada por zumbis e outras ameaças. Em meio ao caos, o exército decide colocar Raccoon em quarentena, ao mesmo tempo que a Umbrella envia uma equipe especializada para encobrir evidências de seus crimes. Com medo de que alguém do S.T.A.R.S. convença a sociedade de sua culpa, a corporação despacha Nêmesis, um mortal caçador, para aniquilar todos os sobreviventes, sendo Jill um de seus principais alvos. Em sua luta para desmascarar os culpados e salvar os inocentes de Raccoon, ela encontra em Carlos Oliveira, do esquadrão de contenção da Umbrella, um grande aliado para escapar das ameaças que espreitam a cidade.",
    numPaginas: "253",
    situacaoLivro: false,
    anoLivro: "2017",
  ),
  BookData(
    idLivro: 8,
    quantExemplares: "20",
    capaLivro: "https://m.media-amazon.com/images/I/5122jZUCZcL.jpg",
    tituloLivro: "A ascensão do Governador - The Walking Dead",
    autorLivro: "Robert Kirkman",
    editoraLivro: "Editora Record",
    descriLivro:
        "A franquia de zumbis mais celebrada da década acaba de conquistar um novo universo. Inspirado na série de quadrinhos best-seller do New York Times — publicada desde 2003 e vencedora do Eisner Award —, que originou o bem-sucedido seriado de TV homônimo, The walking dead: A ascensão do Governador, primeiro volume de uma trilogia, narra a origem de um mais perversos personagens da ficção. Criador dos quadrinhos e um dos produtores do seriado que já bateu diversos recordes de audiência nos Estados Unidos e foi finalista em várias categorias no 68º Golden Globe Awards, incluindo Melhor Série Dramática de TV, Robert Kirkman é co-autor deste romance com o veterano do gênero de horror Jay Bonansinga.",
    numPaginas: "427",
    situacaoLivro: true,
    anoLivro: "2012",
  ),
  BookData(
    idLivro: 9,
    quantExemplares: "7",
    capaLivro: "https://m.media-amazon.com/images/I/51OSfpD1mSL.jpg",
    tituloLivro: "A revolução russa",
    autorLivro: "Sheila Fitzpatrick",
    editoraLivro: "Todavia",
    descriLivro:
        "Passados cem anos, a Revolução Russa continua a ser considerada um acontecimento decisivo para compreender o século XX e o tempo em que vivemos. Levou à implantação do regime comunista, abriu caminho para a criação da União Soviética e moldou boa parte da geopolítica global. Com erudição e clareza, Sheila Fitzpatrick, uma das maiores autoridades no tema, narra a saga da revolução marxista que buscava derrubar o Czar e sonhava, assim, transformar a Rússia e o mundo. A Revolução Russa chega agora em edição revista e atualizada pela autora, lançando uma nova luz sobre um evento-chave da história moderna.",
    numPaginas: "338",
    situacaoLivro: true,
    anoLivro: "2017",
  ),
  BookData(
    idLivro: 10,
    quantExemplares: "11",
    capaLivro: "https://m.media-amazon.com/images/I/51qmrcyD4YL.jpg",
    tituloLivro: "O guia do mochileiro das galáxias",
    autorLivro: "Douglas Adams",
    editoraLivro: "Editora Arqueiro",
    descriLivro:
        "Segundos antes de a Terra ser destruída, Arthur Dent é salvo por Ford Prefect, um E.T. que fazia pesquisa para a nova edição de O Guia do Mochileiro das Galáxias. Pegando carona numa nave alienígena, os dois dão início a uma alucinante viagem pelo tempo e pelo espaço.",
    numPaginas: "241",
    situacaoLivro: true,
    anoLivro: "2010",
  ),
  BookData(
    idLivro: 11,
    quantExemplares: "17",
    capaLivro: "https://m.media-amazon.com/images/I/41NhTt+r6rL._SY346_.jpg",
    tituloLivro: "O chamado de Cthulhu e outros contos",
    autorLivro: "H.P. Lovecraft",
    editoraLivro: "L&PM Pocket",
    descriLivro:
        "O chamado de Cthulhu, escrito em 1926 por Lovecraft, delineou grande parte daquilo que ficaria conhecido como os Mitos de Cthulhu, denominação sob a qual parte de sua obra foi reunida após sua morte. Primorosa por seu detalhamento, revolucionária no próprio formato de conto, esta história é um ponto seminal da sua produção. Este volume abarca histórias dos Mitos de Cthulhu e outras preciosidades da escrita lovecraftiana. Nyarlathotep, A cidade sem nome, A música de Erich Zann, Herbert West – Reanimador, Os ratos nas paredes, Ar frio, O modelo de Pickman, A cor vinda do espaço, A história do Necronomicon e O horror de Dunwich completam esta edição.",
    numPaginas: "400",
    situacaoLivro: false,
    anoLivro: "2017",
  ),
  BookData(
    idLivro: 12,
    quantExemplares: "12",
    capaLivro: "https://m.media-amazon.com/images/I/51UPmi8FVSL.jpg",
    tituloLivro: "Maze Runner: Correr ou morrer",
    autorLivro: "James Dashner",
    editoraLivro: "Plataforma21",
    descriLivro:
        "Ao acordar dentro de um escuro elevador em movimento, a única coisa que Thomas consegue se lembrar é de seu nome. Sua memória está completamente apagada. Mas ele não está sozinho. Quando a caixa metálica chega a seu destino e as portas se abrem, Thomas se vê rodeado por garotos. Bem-vindo à Clareira, fedelho. A Clareira. Um espaço aberto cercado por muros gigantescos. Assim como Thomas, nenhum deles sabe como foi parar ali. Nem por quê. Sabem apenas que todas as manhãs as portas de pedra do Labirinto que os cerca se abrem, e, à noite, se fecham. E que a cada trinta dias um novo garoto é entregue pelo elevador. Porém um fato altera de forma radical a rotina do lugar: chega uma garota, a primeira enviada à Clareira. E mais surpreendente ainda é a mensagem que ela traz consigo. Thomas será mais importante do que imagina. Mas para isso terá de descobrir os sombrias segredos guardados em sua mente e correr... correr muito!",
    numPaginas: "433",
    situacaoLivro: true,
    anoLivro: "2013",
  ),
];

final livrosTotal = [
  BookData(
    idLivro: 19,
    quantExemplares: "9",
    capaLivro: "https://images-na.ssl-images-amazon.com/images/I/51IUA7+1WmL._SX347_BO1,204,203,200_.jpg",
    tituloLivro: "A Menina que Roubava Livros ",
    autorLivro: "Markus Zusak ",
    editoraLivro: " Intrínseca",
    descriLivro:
        "A trajetória de Liesel Meminger é contada por uma narradora mórbida, surpreendentemente simpática. Ao perceber que a pequena ladra de livros lhe escapa, a Morte afeiçoa-se à menina e rastreia suas pegadas de 1939 a 1943. Traços de uma sobrevivente: a mãe comunista, perseguida pelo nazismo, envia Liesel e o irmão para o subúrbio pobre de uma cidade alemã, onde um casal se dispõe a adotá-los por dinheiro. O garoto morre no trajeto e é enterrado por um coveiro que deixa cair um livro na neve. É o primeiro de uma série que a menina vai surrupiar ao longo dos anos. O único vínculo com a família é esta obra, que ela ainda não sabe ler.",
    numPaginas: "480",
    situacaoLivro: true,
    anoLivro: "2007",
  ),
  BookData(
    idLivro: 14,
    quantExemplares: "7",
    capaLivro: "https://m.media-amazon.com/images/I/51OSfpD1mSL.jpg",
    tituloLivro: "A revolução russa",
    autorLivro: "Sheila Fitzpatrick",
    editoraLivro: "Todavia",
    descriLivro:
        "Passados cem anos, a Revolução Russa continua a ser considerada um acontecimento decisivo para compreender o século XX e o tempo em que vivemos. Levou à implantação do regime comunista, abriu caminho para a criação da União Soviética e moldou boa parte da geopolítica global. Com erudição e clareza, Sheila Fitzpatrick, uma das maiores autoridades no tema, narra a saga da revolução marxista que buscava derrubar o Czar e sonhava, assim, transformar a Rússia e o mundo. A Revolução Russa chega agora em edição revista e atualizada pela autora, lançando uma nova luz sobre um evento-chave da história moderna.",
    numPaginas: "338",
    situacaoLivro: true,
    anoLivro: "2017",
  ),
  BookData(
    idLivro: 21,
    quantExemplares: "25",
    capaLivro: "https://images-na.ssl-images-amazon.com/images/I/41egZIo3eYL._SX345_BO1,204,203,200_.jpg",
    tituloLivro: "Capitães da areia",
    autorLivro: "Jorge Amado",
    editoraLivro: "Companhia de Bolso",
    descriLivro:
        "Desde o seu lançamento, em 1937, Capitães da Areia causou escândalo: inúmeros exemplares do livro foram queimados em praça pública, por determinação do Estado Novo. Ao longo de sete décadas a narrativa não perdeu viço nem atualidade, pelo contrário: a vida urbana dos meninos pobres e infratores ganhou contornos trágicos e urgentes. Várias gerações de brasileiros sofreram o impacto e a sedução desses meninos que moram num trapiche abandonado no areal do cais de Salvador, vivendo à margem das convenções sociais. Verdadeiro romance de formação, o livro nos torna íntimos de suas pequenas criaturas, cada uma delas com suas carências e suas ambições: do líder Pedro Bala ao religioso Pirulito, do ressentido e cruel Sem-Pernas ao aprendiz de cafetão Gato, do sensato Professor ao rústico sertanejo Volta Seca. Com a força envolvente da sua prosa, Jorge Amado nos aproxima desses garotos e nos contagia com seu intenso desejo de liberdade.",
    numPaginas: "280",
    situacaoLivro: true,
    anoLivro: "2009",
  ),
  new BookData(
    idLivro: 18,
    quantExemplares: "23",
    capaLivro:
        "https://http2.mlstatic.com/D_NQ_NP_855423-MLB41572489335_042020-O.jpg",
    tituloLivro: "Dom Casmurro",
    autorLivro: "Machado de Assis ",
    editoraLivro: "L&PM Editores",
    descriLivro:
        "Capitu, Bentinho e Escobar formam o triângulo amo­roso mais conhecido da literatura nacional – com a condição de que acreditemos no narrador de um dos mais polêmicos romances brasileiros. Quem conta a his­tória de Dom Cas­murro é o próprio Bento Santiago, agora um senhor maduro que relembra a infância passada no bairro carioca de Mata­cavalos, quando conheceu o amor de sua vida: Capitu.",
    numPaginas: "287",
    situacaoLivro: true,
    anoLivro: "1997",
  ),
  new BookData(
    idLivro: 16,
    quantExemplares: "11",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/51D7-jlIuzL._SX342_SY445_QL70_ML2_.jpg",
    tituloLivro: "Five Nights at Freddy's: Olhos Prateados",
    autorLivro: "Scott Cawthon",
    editoraLivro: "Intrínseca ",
    descriLivro:
        "No popular videogame criado por Scott Cawthon, o jogador assume o papel de um segurança contratado para tomar conta de uma pizzaria durante a noite, enquanto os animatrônicos perambulam e ganham ímpeto violento. Mas o mistério por trás dessas criaturas e dos assassinatos que ocorreram ali nunca foi desvendado... até agora. Olhos prateados extrapola o universo que conquistou fãs no mundo todo e traz à tona os medos mais obscuros que só brinquedos sinistros são capazes de provocar.",
    numPaginas: "289",
    situacaoLivro: true,
    anoLivro: "2017",
  ),
  new BookData(
    idLivro: 15,
    quantExemplares: "46",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/51ZdGHmCBOL._SX332_BO1,204,203,200_.jpg",
    tituloLivro: "Harry Potter",
    autorLivro: "J.K. Rowling",
    editoraLivro: "Pottermore Publishing ",
    descriLivro:
        "Quando virou o envelope, com a mão trêmula, Harry viu um lacre de cera púrpura com um brasão; um leão, uma águia, um texugo e uma cobra circulando uma grande letra \"H\". Harry Potter nunca havia ouvido falar de Hogwarts quando as cartas começaram a aparecer no capacho da Rua dos Alfeneiros, nº 4. Escritos a tinta verde-esmeralda em pergaminho amarelado com um lacre de cera púrpura, as cartas eram rapidamente confiscadas por seus pavorosos tio e tia. Então, no aniversário de onze anos de Harry, um gigante com olhos que luziam como besouros negros chamado Rúbeo Hagrid surge com notícias surpreendentes: Harry Potter é um bruxo e tem uma vaga na Escola de Magia e Bruxaria de Hogwarts. Uma incrível aventura está para começar!",
    numPaginas: "309",
    situacaoLivro: true,
    anoLivro: "2015",
  ),
  new BookData(
    idLivro: 20,
    quantExemplares: "18",
    capaLivro:
        "https://images-na.ssl-images-amazon.com/images/I/51NtrTTaf5L._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    tituloLivro: "O corvo e outros contos extraordinários",
    autorLivro: "Edgar Allan Poe",
    editoraLivro: "Principis",
    descriLivro:
        "O Corvo e contos extraordinários é uma seleção dos textos mais expressivos do autor considerado o mestre do mistério e procura mostrar o gênio criativo de um dos mais conhecidos escritores americanos. Além dos contos, este volume também traz a tradução do poema O Corvo feita por Fernando Pessoa.",
    numPaginas: "144",
    situacaoLivro: true,
    anoLivro: "2019",
  ),
  new BookData(
    idLivro: 17,
    quantExemplares: "20",
    capaLivro:
        "https://a-static.mlcdn.com.br/1500x1500/livro-o-pequeno-principe/saraiva/8984162/a6edc3750f84a51ff2aec7fd4928e4fa.jpg",
    tituloLivro: "O Pequeno Príncipe",
    autorLivro: "Antoine de Saint-Exupéry",
    editoraLivro: "HarperCollins Brasil",
    descriLivro:
        "Livro de criança? Com certeza. Livro de adulto também, pois todo homem traz dentro de si o menino que foi. Como explicar a adoção deste livro por povos tão variados, em tantos países de todos os continentes? Como explicar que ele seja lido sempre por tantos milhões e milhões de pessoas? Como explicar a atualidade deste livro traduzido em oitenta línguas diferentes? Como compreender que uma história aparentemente tão ingênua seja comovente para tantas pessoas? O pequeno príncipe devolve a cada um o mistério da infância. De repente retornam os sonhos. Reaparece a lembrança de questionamentos, desvelam-se incoerências acomodadas, quase já imperceptíveis na pressa do dia a dia. Voltam ao coração escondidas recordações. O reencontro, o homem-menino.",
    numPaginas: "113",
    situacaoLivro: true,
    anoLivro: "2013",
  ),
  BookData(
    idLivro: 13,
    quantExemplares: "20",
    capaLivro: "https://m.media-amazon.com/images/I/51JmNnhIWTL.jpg",
    tituloLivro: "Resident Evil Conspiração Umbrella",
    autorLivro: "S.D Perry",
    editoraLivro: "Benvirá",
    descriLivro:
        "Este livro é fundamental para os fãs de Resident Evil que desejam entender o incidente em Raccoon City, que teve início na fabulosa mansão Spencer. Usando como pano de fundo a história do primeiro jogo da série, S.D. Perry reconta os acontecimentos registrados nas montanhas Arklay, onde ocorrências de canibalismo assustam a população. A autora vai além da narrativa original e acrescenta momentos anteriores à missão dos S.T.A.R.S., com novas situações para envolver os leitores na busca por respostas aos casos bizarros que, de alguma forma, estão relacionados à corporação Umbrella. Aventure-se nas descobertas de Chris Redfield e Jill Valentine, que lutam pelas suas vidas para não serem engolidos pela escuridão eterna. Surpreenda-se ao encarar o seu próprio medo das coisas que se escondem por trás de cada esquina. Boa leitura!",
    numPaginas: "200",
    situacaoLivro: true,
    anoLivro: "2015",
  ),
  BookData(
    idLivro: 21,
    quantExemplares: "21",
    capaLivro: "https://images-na.ssl-images-amazon.com/images/I/41Op9WQjjtL._SY344_BO1,204,203,200_QL70_ML2_.jpg",
    tituloLivro: "Senhor das moscas",
    autorLivro: "William Golding",
    editoraLivro: "Alfaguara",
    descriLivro:
        "Publicado originalmente em 1954, Senhor das Moscas é um dos romances essenciais da literatura mundial. Adaptado duas vezes para o cinema e traduzido para 35 idiomas, o clássico de William Golding já foi visto como uma alegoria, uma parábola, um tratado político e mesmo uma visão do apocalipse. Durante a Segunda Guerra Mundial, um avião cai numa ilha deserta, e seus únicos sobreviventes são um grupo de meninos. Liderados por Ralph, eles procuram se organizar enquanto esperam um possível resgate. Mas aos poucos esses garotos aparentemente inocentes transformam a ilha numa visceral disputa pelo poder, e sua selvageria rasga a fina superfície da civilidade. Ao narrar a história de meninos perdidos numa ilha, aos poucos se deixando levar pela barbárie, Golding constrói uma reflexão sobre a natureza do mal e a tênue linha entre o poder e a violência desmedida. A nova tradução para o português mostra como Senhor das Moscas mantém o mesmo impacto desde seu lançamento: um clássico moderno; um livro que retrata de maneira inigualável as áreas de sombra e escuridão da essência do ser humano.",
    numPaginas: "224",
    situacaoLivro: true,
    anoLivro: "2014",
  ),
];
