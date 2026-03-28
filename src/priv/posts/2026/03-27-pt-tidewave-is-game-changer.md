
%{
    title: "Tidewave mudou minha experiência com IA",
    author: "Fabricio Damazio",
    tags: ~w(programming elixir),
    description: "Nunca fui entusiasta de programar com IA, mas Tidewave mudou o jogo."
}
---

<p align="center">
    <img src="/images/posts/2026/03-27-tidewave.png" alt="Tidewave aberto no navegador" width="384" height="544">
</p>

Nunca escondi de ninguém que não sou o maior entusiasta de programar utilizando IA. Desde o início, com o autocomplete inline do Copilot, não tive uma boa experiência pessoal. O autocomplete sempre me pareceu invasivo e toda sugestão me roubava a atenção e incomodava. Depois disso, perdi o interesse em ter um assistente de IA e meu uso se resumiu a buscas de informação e geração de pequenos trechos de código.

Mais recentemente comecei a explorar um pouco mais como seria programar com agentes. Tenho uma licença de estudante do Github Copilot Pro e comecei a usa-lo integrado ao Zed para me ajudar a programar. Confesso que a experiência foi bem melhor dos tempos do autocomplete (que mantenho desligado até os dias de hoje), mas ainda não estava me sentindo à vontade. É difícil explicar esta sensação, mas é como estar trabalhando na camada errada de abstração. O código da minha aplicação está rodando no browser e o agente esta na minha IDE vendo meu código estático. Minha aplicação só existe em runtime. Quando a aplicação esta executando, ela está viva, fazendo queries no banco de dados, logando no terminal e manipulando dados em uma UI dinâmica e complexa. O Agente deveria estar lá, rodando dentro da minha aplicação, vendo a UI ser usada, lendo os logs gerados e analisando minhas queries no banco.

## A "descoberta" do Tidewave

Acompanho a comunidade Elixir sempre que dá. Não trabalho no dia a dia com Elixir porém sempre que posso no tempo livre tento utilizá-la (este blog inclusive é escrito em Elixir). Se me lembro bem, meados do ano passado o criador do Elixir, José Valim, lançou um produto chamado [Tidewave](https://tidewave.ai/) e, como tinha a ver com IA, eu não dei muita atenção na época.

Voltando ao presente, nos meus testes com o Copilot Pro eu me lembrei do Tidewave. Ela é descrita como uma ferramenta que transforma seu agente em um "desenvolvedor full-stack", executando diretamente em sua aplicação em runtime (o Tidewave é adicionado como uma dependência em dev). Na prática, ela funciona como um servidor MCP com interface visual, permitindo que seu agente de IA possa ver o que você vê. O agente pode navegar pela aplicação, identificar erros visualmente, consultar o banco de dados e testar mudanças — tudo sem precisar que você descreva ou copie manualmente erros e interfaces.

Ao instalar e começar a usar a sua versão trial, eu senti a diferença de imediato. O agente implementou pequenas features de UI que pedi e as testou diretamente no navegador utilizando javascript. Foi capaz de ler meus logs em runtime e entender os erros no momento que aconteceram e consertá-los. Aquela sensação estranha de parecer estar na camada de abstração errada desapareceu. Gostei tanto que assinei a versão pro no outro dia para continuar meus experimentos.

## Meu workflow usando Tidewave

Ainda estou em fase de experimentação porém já encontrei um fluxo de trabalho satisfatório. Configurei a conexão entre o Tidewave e o Github Copilot. Venho utilizando o modelo Gemini 3.1 Pro porque é o melhor modelo top tier disponível na assinatura pro (Microsoft removeu acesso ao Sonnet e Opus desse tier).  

Eu abro o código da aplicação no Zed e deixo a aplicação rodando no terminal. Já no navegador, o Tidewave me deixa um chat aberto junto com a aplicação executando e nele vou explicando o que quero. Posso selecionar os elementos na DOM para dar um contexto melhor pro agente e o assisto testando a aplicação através de sua UI (como se fosse um usuário) em tempo real. Ao terminar a implementação eu volto ao Zed para conferir as mudanças e refatorar. Em geral, a IA cria código satisfatório, mas a refatoração manual do código e de sua estrutura tem que ser constante para não virar uma grande bagunça. Quando tudo está bem estruturado e limpo, faço commit das mudanças.


Minha rotina nesta última semana, quando tenho tempo livre, tem sido essa. Tem sido prazeroso e divertido. Parece que estou achando um jeito legal de usar IA sem me deixar alienado do código da aplicação. Ao refatorar manualmente e cuidar da estrutura do projeto eu mantenho minhas habilidades de programar e meu entendimento da aplicação atualizados.

Vejo pessoas criando coisas com agentes autônomos, muitas vezes com diversos deles rodando ao mesmo tempo. Eu acho que nunca vou conseguir fazer isso. Eu gosto de programar, de entender minha aplicação e de ser parte do processo. Nesses novos tempos, programar sem utilizar IA é se arriscar a se tornar um programador anacrônico e quero evitar que isso aconteça comigo. Mas tenho meus limites. Nunca vou abrir mão de ser a parte mais importante do processo. 

---
