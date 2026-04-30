
%{
    title: "Devlog 00: Projeto Bellinha, do papel ao protótipo",
    author: "Fabricio Damazio",
    tags: ~w(devlog gamedev),
    description: "Tirando a ideia do meu \"primeiro\" jogo do papel."
}
---

Em meados do ano passado, minha gata de estimação (chamada Bellinha) nos deixou. Ela tinha aproximadamente 13 anos e estava doente. Nunca é fácil perder um pet. Eles se tornam parte do nosso dia a dia e perdê-los deixa um vazio em nossas vidas. É uma experiência realmente difícil. 

Um tempo depois disso, comecei a pensar em um novo projeto. Um jogo sobre o relacionamento de um garoto e sua gata. Aos poucos fui documentando as ideias sem muito compromisso e as anotações soltas foram sendo estruturadas até que transformei tudo em um pequeno documento de design do jogo.

O projeto Bellinha ainda está no começo. Algumas ideias já estão bem definidas, outras ainda estão sendo testadas e muita coisa provavelmente vai mudar até virar um jogo completo. Este devlog existe para registrar esse processo: as decisões, o protótipo, os erros e as pequenas descobertas no caminho.

***IMPORTANTE: estou à procura de uma concept artist/diretor de arte para trabalhar neste projeto. Um trabalho freelance pago (que esteja dentro do meu pequeno orçamento disponível)***.

# **O projeto Bellinha**

É o projeto de um jogo narrativo 3D sobre vínculo, memória e cuidado. A ideia é construir uma experiência curta, contemplativa e emocional, com um certo nível de exploração e puzzles integrados ao mundo. Quero contar a história do relacionamento de um garoto e sua gata, uma experiência pessoal contada através do jogo. 

O visual deve ser low-poly simples (quero tentar aprender e fazer pelo menos parte dos assets). A visão do jogador será fixa em uma perspectiva isométrica na faixa de 45 graus com FOV baixo (ao estilo do jogo Tunic). Não posso pensar em gráficos extremamente elaborados porque não tenho a habilidade necessária nem orçamento suficiente para isso. 

Estou desenvolvendo esse projeto no meu tempo livre e acredito que levarei cerca de dois anos para produzi-lo do jeito que eu quero. Já separei um orçamento para contratações pontuais de arte, áudio, marketing e localização. O orçamento é pequeno porque é um dinheiro que vai sair diretamente das minhas economias.


# Meta atual: protótipo

A primeira fase do desenvolvimento é um protótipo jogável da primeira área do jogo. Essa área funciona como tutorial orgânico que precisa apresentar movimento, pulo, interação, diálogos, exploração, coleta de itens e os primeiros puzzles. Tudo isso sem depender de longos tutoriais ou explicações fora do mundo do jogo.

O protótipo inteiro ainda usa assets temporários de prototipação que comprei e formas simples. Antes de pensar em arte final, trilha sonora, trailer ou página de loja, eu preciso descobrir se a base do jogo funciona. O personagem precisa ser agradável de controlar, a câmera precisa enquadrar bem os espaços, as interações precisam ser claras e o mundo precisa começar a comunicar a sensação certa mesmo usando placeholders.

É com esse protótipo, e com sessões de playtest, que pretendo validar tudo isso.

# O que já existe hoje

Até agora, a base já começou a sair do papel. Criei o projeto na Godot e já tenho movimento, pulo, câmera, interação e diálogo funcionando em forma inicial. Também comecei o blockout da primeira área, ainda com formas simples e assets temporários. Visualmente não é lá muito bonito:

<p align="center">
    <img src="/images/posts/2026/04-30-bellinha1.png" alt="Tela inicial do OpenCode aberta no terminal" width="384" height="544">
</p>

Os sistemas de câmera, diálogo e interação são simples e bem específicos para este jogo. Por isso, decidi não usar nenhum dos ótimos plugins criados pela comunidade. Todos serão criados do zero. 

O jogador já se move em 3D com aceleração e desaceleração suaves. O pulo também já está implementado com alguns ajustes de game feel, como coyote time e jump buffer. São detalhes pequenos, mas fazem muita diferença para o controle parecer menos rígido.

A câmera fixa também já está funcionando. Ela segue o jogador suavemente, respeita limites por área e tem suporte a zoom controlado por script. Uma decisão importante foi usar perspectiva com FOV baixo em vez de câmera ortográfica real, para manter um visual parecido com isométrico sem abrir mão de iluminação e sombras melhores no Godot.

Além disso, o sistema de interação já existe. O jogador detecta objetos próximos, vê um prompt contextual e pode interagir com objetos examináveis, itens coletáveis e NPCs. 

O sistema de diálogo tem caixa de texto, nome do personagem, efeito de digitação, avanço por input e bloqueio do movimento enquanto o diálogo está ativo. Também suporta eventos disparados por falas, o que vai ser importante para coisas como entregar itens e liberar caminhos. O vídeo abaixo mostra um pouco da interação com um NPC e o sistema de diálogo:

<video width="1024" height="768" controls>
  <source src="/images/posts/2026/04-30-bellinha1.mp4" type="video/mp4">
      Seu navegador não suporta a tag video.
</video>

A primeira área funciona como um laboratório para o resto do jogo. Ela precisa ensinar movimentação, pulo, interação e leitura do cenário sem depender de tutoriais ou dicas óbvias. Também é onde começo a testar como um espaço pode carregar emoção sem precisar explicar tudo em texto.

Internamente, essa área tem um tema emocional bem específico, mas ainda prefiro falar dele aos poucos conforme o protótipo amadurece.

# Próximos passos

O próximo passo é continuar fechando o blockout da primeira área e testar se o percurso faz sentido de ponta a ponta. Depois disso, entram as mecânicas específicas da área, os puzzles e os primeiros itens coletáveis. Tudo isso com gráficos em versão placeholder.

Este primeiro post é menos sobre mostrar um jogo pronto e mais sobre marcar o ponto de partida. Bellinha ainda está em fase muito inicial, mas agora já existe algo para testar, ajustar e melhorar. Ainda não falei muito sobre a história e os personagens, porque existem muitas pontas soltas e decisões em aberto. Nos próximos devlogs trago mais detalhes. 

---
